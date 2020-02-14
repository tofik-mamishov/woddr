//
//  DPSettingsPresenter.swift
//  woddr
//
//  Created by Tofik Mamishov on 08/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class DPSettingsPresenter: DPSettingsPresenterProtocol {
    private weak var view: DPSettingsViewProtocol!
    private var interactor: DPSettingsInteractorProtocol!
    var router: DPSettingsRouterProtocol!

    private var difficultyPickerManager: SimplePickerViewManager!

    init(view: DPSettingsViewProtocol,
         interactor: DPSettingsInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }

    func viewDidLoad() {
        setupDifficultyPickerManager()
        //setupWillpowerBoostStepper()
        setupAgainPointSelector()
        setupOnesToCancel()
    }

    fileprivate func setupDifficultyPickerManager() {
        self.difficultyPickerManager = SimplePickerViewManager(possibleValues: Array(2...10))
        self.difficultyPickerManager.rowHeight = 50.0
        self.difficultyPickerManager.widthOfComponent = 60.0
        self.difficultyPickerManager.fontSize = 50.0
        self.difficultyPickerManager.didSelectRowHandler = { value in
            self.interactor.saveDiceDifficultyPreset(value: value)
        }
        self.view.diceDifficultyPicker.delegate = self.difficultyPickerManager
        self.view.diceDifficultyPicker.dataSource = self.difficultyPickerManager
        self.difficultyPickerManager.setValue(self.view.diceDifficultyPicker,
                                              value: self.interactor.diceDifficultyPreset())
        self.view.diceDifficultyPicker.deckTransitioningDelegate = self.view.deckTransitioningDelegate
    }

    private func setupWillpowerBoostStepper() {
        view.willpowerBoostStepper.isEnabled = true
        switch interactor.willPowerBoostTypePreset {
        case .noBoost:
            view.willpowerBoostStepper.isEnabled = false
            return
        case .onePoint:
            view.willpowerBoostStepper.max = 1
        case .noLimit:
            view.willpowerBoostStepper.max = 99
        }
        view.willpowerBoostStepper.value = interactor.willPowerBoostPreset
        view.willpowerBoostStepper.addTarget(self, action: #selector(onWillpowerBoostChange(_:)),
                                             for: .valueChanged)
    }

    private func setupAgainPointSelector() {
        view.againPointSelector.value = interactor.againPointPreset
        view.againPointSelector.addTarget(self, action: #selector(onAgainPointChange(_:)),
                                          for: .valueChanged)
    }

    private func setupOnesToCancel() {
        view.onesToCancelContainer.isHidden = !interactor.cancelSuccessPreset
        if interactor.cancelSuccessPreset {
            view.onesToCancelStepper.value = interactor.cancelationOfOnePreset
            view.onesToCancelStepper.addTarget(self, action: #selector(onOnesToCancelChange(_:)),
                                               for: .valueChanged)
        }
    }

    @objc private func onWillpowerBoostChange(_ stepper: StepperView) {
        interactor.willPowerBoostPreset = stepper.value
    }

    @objc private func onAgainPointChange(_ selector: AgainPointSelector) {
        interactor.againPointPreset = selector.value
    }

    @objc private func onOnesToCancelChange(_ stepper: StepperView) {
        interactor.cancelationOfOnePreset = stepper.value
    }

    func dismiss() {
        self.view.dismiss(animated: true, completion: nil)
    }

    func onClose() {
        self.router.close()
    }
}
