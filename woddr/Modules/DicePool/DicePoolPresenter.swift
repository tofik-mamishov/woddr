//
//  DicePoolPresenter.swift
//  woddr
//
//  Created by Tofik Mamishov on 09/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//
import UIKit
import Foundation

class DicePoolPresenter: DicePoolPresenterProtocol {
    private static let failTextColor = UIColor(red: 0.557, green: 0.557,
                                                          blue: 0.557, alpha: 1.0)

    private static let eightAgainIndex = 0
    private static let nineAgainIndex = 1
    private static let tenAgainIndex = 2

    private weak var view: DicePoolViewProtocol!
    private var interactor: DicePoolInteractorProtocol!
    private var userInitiatedQueue: DispatchQueue!
    private var diceNumberPickerManager: PickerViewManager!
    private var difficultyPickerManager: PickerViewManager!

    var router: DicePoolRouterProtocol!

    init(view: DicePoolViewProtocol, interactor: DicePoolInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.userInitiatedQueue = DispatchQueue.global(qos: .userInitiated)
    }

    func getRollResults() -> [[RollResult]] {
        return self.interactor.rollResults
    }

    func roll() {
        self.beforeRoll()
        self.userInitiatedQueue.asyncAfter(deadline: .now() + 0.3) {
            self.interactor.roll(count: self.diceNumberPickerManager.value())
            DispatchQueue.main.async {
                self.afterRoll()
            }
        }
    }

    func beforeRoll() {
        self.view.getSeeDetails().isHidden = true
        self.view.getSuccessesNumber().isHidden = true
        self.view.getRollButton().isEnabled = false
        self.view.getSuccessesLoadIndicator().startAnimating()
    }

    func afterRoll() {
        self.view.getSuccessesLoadIndicator().stopAnimating()
        self.view.getSeeDetails().isHidden = self.interactor.rollResults.isEmpty
        self.view.getSuccessesNumber().isHidden = false
        self.view.getSuccessesNumber().text = "\(self.interactor.successCount ?? 0)"
        self.view.getSuccessesNumber().textColor = self.getColorOfSuccessNumber()
        self.view.getThresholdValue().text = "\(self.interactor.thresholdValue())"

        self.view.getRollButton().isEnabled = true
    }

    private func getColorOfSuccessNumber() -> UIColor {
        return self.interactor.successCount >= self.interactor.difficultyPreset() ?
            UIColor.white : DicePoolPresenter.failTextColor
    }

    func viewDidLoad() {
        self.diceNumberPickerManager = PickerViewManager(componentsNumber: 2)
        self.view.getDiceNumberPicker().delegate = self.diceNumberPickerManager
        self.view.getDiceNumberPicker().dataSource = self.diceNumberPickerManager

        self.difficultyPickerManager = PickerViewManager(componentsNumber: 2)
        self.difficultyPickerManager.rowHeight = 35.0
        self.difficultyPickerManager.widthOfComponent = 30.0
        self.difficultyPickerManager.fontSize = 35.0
        self.difficultyPickerManager.didSelectRowHandler = { value in
            self.interactor.saveDifficultyPreset(value: value)
        }
        self.view.getDifficultyPicker().delegate = self.difficultyPickerManager
        self.view.getDifficultyPicker().dataSource = self.difficultyPickerManager
        self.difficultyPickerManager.setValue(self.view.getDifficultyPicker(),
                                              value: self.interactor.difficultyPreset())
    }

    func viewWillAppear() {
        view.thresholdContainer.isHidden = !interactor.showThreshold
    }

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.router.prepare(for: segue, sender: sender)
    }
}
