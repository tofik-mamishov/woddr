//
//  DicePoolPresetsPresenter.swift
//  woddr
//
//  Created by Tofik Mamishov on 12/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

class DicePoolPresetsPresenter: DicePoolPresetsPresenterProtocol {
    private weak var view: DicePoolPresetsViewProtocol!
    private var interactor: DicePoolPresetsInteractorProtocol!

    init(view: DicePoolPresetsViewProtocol,
         interactor: DicePoolPresetsInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }

    func viewDidLoad() {
        self.view.getRoteActionsSwitch().isOn = self.interactor.roteActionsPreset()
        self.view.getCancelSuccessSwitch().isOn = self.interactor.cancelSuccessPreset()
        view.showThresholdSwitch.isOn = interactor.showThreshold
    }

    func viewWillAppear() {
        self.view.getSelectedCritRule().text = String(self.interactor.critRulePreset().name)
        //self.view.selectedWillpowerBoost.text = String(self.interactor.willpowerBoost.name)
    }

    func saveRoteActionsPreset(value: Bool) {
        self.interactor.saveRoteActionsPreset(value: value)
    }

    func saveCancelSuccessPreset(value: Bool) {
        self.interactor.saveCancelSuccessPreset(value: value)
    }

    func saveShowThresholdPreset(value: Bool) {
        interactor.showThreshold = value
    }
}
