//
//  DPMiniSettingsPresenter.swift
//  woddr
//
//  Created by Tofik Mamishov on 07/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import UIKit

class DPMiniSettingsPresenter: DPMiniSettingsPresenterProtocol {
    private weak var view: DPMiniSettingsViewProtocol!
    private var interactor: DPMiniSettingsInteractorProtocol!
    var router: DPMiniSettingsRouterProtocol!

    init(view: DPMiniSettingsViewProtocol,
         interactor: DPMiniSettingsInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }

    func viewDidAppear() {
        loadDiceDifficulty()
        loadAgain()
    }

    func drawTopBorder() {
        let borderColor = UIColor(red: 0.557, green: 0.557,
                                  blue: 0.557, alpha: 0.3).cgColor
        let borderThickness = CGFloat(0.5)
        self.view.view.addBorder(toSide: .top, withColor: borderColor,
                                 andThickness: borderThickness)
    }

    func loadDiceDifficulty() {
        self.view.diceDifficultyLabel.text = String(interactor.diceDifficultyPreset)
    }

    func loadWillpowerBoost() {
        //self.view.willpowerBoostLabel.text = String(interactor.willPowerBoostPreset)
    }

    func loadAgain() {
        self.view.againLabel.text = String(interactor.againPreset)
    }

    func fadeIn() {
        UIView.animate(withDuration: 1.0, animations: {
            self.view.view.alpha = 1
        })
    }

    func fadeOut() {
        self.view.view.alpha = 0
    }

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.router.prepare(for: segue, sender: sender)
    }
}
