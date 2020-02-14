//
//  ChanceRollViewController.swift
//  woddr
//
//  Created by Tofik Mamishov on 12/03/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

import UIKit

class ChanceRollViewController: UIViewController, ChanceRollViewProtocol {
    @IBOutlet weak var successesNumber: UILabel!
    @IBOutlet weak var dramaticFailure: UILabel!
    @IBOutlet weak var successesLoadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var rollResults: UILabel!
    @IBOutlet weak var rollResultsNumber: UILabel!
    @IBOutlet weak var rollResultsActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var rollButton: UIButton!

    var presenter: ChanceRollPresenterProtocol!

    @IBAction func roll(_ sender: UIButton) {
        self.presenter.roll()
    }

    func beforeRoll() {
        self.successesNumber.isHidden = true
        self.rollResultsNumber.isHidden = true
        self.rollButton.isEnabled = false
        self.successesLoadIndicator.startAnimating()
        self.rollResultsActivityIndicator.startAnimating()
    }

    func afterRoll() {
        self.successesLoadIndicator.stopAnimating()
        self.rollResultsActivityIndicator.stopAnimating()
        self.rollResultsNumber.isHidden = false
        self.rollResultsNumber.text = self.presenter.rollResults
        self.successesNumber.isHidden = false
        self.successesNumber.text = "\(self.presenter.successCount ?? 0)"
        self.dramaticFailure.isHidden = !self.presenter.isDramaticFailure
        self.rollButton.isEnabled = true
    }
}
