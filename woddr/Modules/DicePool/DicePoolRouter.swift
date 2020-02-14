//
//  DicePoolRouter.swift
//  woddr
//
//  Created by Tofik Mamishov on 21/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//
import UIKit

class DicePoolRouter: DicePoolRouterProtocol {
    private weak var presenter: DicePoolPresenterProtocol!

    init(presenter: DicePoolPresenterProtocol) {
        self.presenter = presenter
    }

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier ?? ""
        let destination = segue.destination
        switch identifier {
        case "DicePoolSeeDetails":
            self.prepareDetailsViewController(destination: destination)
        default:
            return
        }
    }

    private func prepareDetailsViewController(destination viewController: UIViewController) {
        guard let detailsViewController = viewController as? DetailsViewController else {
            fatalError("Unexpected destination: \(viewController)")
        }
        detailsViewController.presenter.rollResults.append(contentsOf: self.presenter.getRollResults())
    }
}
