//
//  InitiativeRollViewController.swift
//  woddr
//
//  Created by Tofik Mamishov on 17/03/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

import UIKit

class InitiativeRollViewController: UIViewController, InitiativeRollViewProtocol {

    @IBOutlet weak var modifierPickerView: UIPickerView!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var resultLoadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var rollResult: UILabel!
    @IBOutlet weak var rollResultLoadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var rollButton: UIButton!

    var presenter: InitiativeRollPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.modifierPickerView.delegate = self.presenter.pickerViewDelegate()
        self.modifierPickerView.dataSource = self.presenter.pickerViewDataSource()
    }

    @IBAction func roll(_ sender: UIButton) {
        self.presenter.roll()
    }

    func beforeRoll() {
        self.rollButton.isEnabled = false
        self.result.isHidden = true
        self.rollResult.isHidden = true
        self.resultLoadIndicator.startAnimating()
        self.rollResultLoadIndicator.startAnimating()
    }

    func afterRoll() {
        self.resultLoadIndicator.stopAnimating()
        self.rollResultLoadIndicator.stopAnimating()
        self.result.isHidden = false
        self.result.text = "\(self.presenter.total ?? 0)"
        self.rollResult.isHidden = false
        self.rollResult.text = "\(self.presenter.rollResult ?? 0)"
        self.rollButton.isEnabled = true
    }
}
