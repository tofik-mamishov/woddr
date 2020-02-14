//
//  ChanceRollPresenter.swift
//  woddr
//
//  Created by Tofik Mamishov on 16/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//
import Foundation

class ChanceRollPresenter: ChanceRollPresenterProtocol {
    private weak var view: ChanceRollViewProtocol!
    private var interactor: ChanceRollInteractorProtocol!
    private var userInitiatedQueue: DispatchQueue!

    var successCount: Int! {
        return self.interactor.successCount
    }
    var isDramaticFailure: Bool! {
        return self.interactor.isDramaticFailure
    }
    var rollResults: String! {
        var rollResults = ""
        for rollResultIndex in 0..<self.interactor.rollResults.count {
            rollResults += "\(self.interactor.rollResults[rollResultIndex])"
            if rollResultIndex < self.interactor.rollResults.endIndex - 1 {
                rollResults += ", "
            }
        }
        return rollResults
    }

    init(view: ChanceRollViewProtocol, interactor: ChanceRollInteractorProtocol) {
        self.view = view
        self.interactor = interactor
        self.userInitiatedQueue = DispatchQueue.global(qos: .userInitiated)
    }

    func roll() {
        self.view.beforeRoll()
        self.userInitiatedQueue.asyncAfter(deadline: .now() + 0.3) {
            self.interactor.roll()
            DispatchQueue.main.async {
                self.view.afterRoll()
            }
        }
    }
}
