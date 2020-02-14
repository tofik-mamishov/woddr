//
//  InitiativeRollPresenter.swift
//  woddr
//
//  Created by Tofik Mamishov on 18/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//
import Foundation
import UIKit

class InitiativeRollPresenter: InitiativeRollPresenterProtocol {
    private weak var view: InitiativeRollViewProtocol!
    private var interactor: InitiativeRollInteractorProtocol!
    private var userInitiatedQueue: DispatchQueue!
    private var modifierPickerManager: PickerViewManager!

    var rollResult: Int! {
        return self.interactor.rollResult
    }
    var total: Int! {
        return self.interactor.total
    }
    let numberOfComponentsInPickerView: Int! = 2
    let numberOfRowsInComponentOfPickerView: Int! = 10
    let rowHeightForComponentOfPickerView: CGFloat! = CGFloat(70.0)
    let widthForComponentOfPickerView: CGFloat! = CGFloat(45.0)

    init(view: InitiativeRollViewProtocol, interactor: InitiativeRollInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.userInitiatedQueue = DispatchQueue.global(qos: .userInitiated)
        self.modifierPickerManager = PickerViewManager(componentsNumber: 2)
    }

    func roll() {
        self.view.beforeRoll()
        self.userInitiatedQueue.asyncAfter(deadline: .now() + 0.3) {
            self.interactor.roll(modifier: self.modifierPickerManager.value())
            DispatchQueue.main.async {
                self.view.afterRoll()
            }
        }
    }

    func pickerViewDelegate() -> UIPickerViewDelegate {
        return self.modifierPickerManager
    }

    func pickerViewDataSource() -> UIPickerViewDataSource {
        return self.modifierPickerManager
    }
}
