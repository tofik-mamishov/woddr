//
//  ViewController.swift
//  woddr
//
//  Created by Tofik Mamishov on 29/01/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

import UIKit

class DicePoolViewController: UIViewController, DicePoolViewProtocol {

    @IBOutlet weak var diceNumberPicker: UIPickerView!
    @IBOutlet weak var successesNumber: UILabel!
    @IBOutlet weak var seeDetails: UIButton!
    @IBOutlet weak var successesLoadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var difficultyPicker: UIPickerView!
    @IBOutlet weak var thresholdValue: UILabel!
    @IBOutlet weak var thresholdContainer: UIStackView!

    var presenter: DicePoolPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        StoreReviewHelper.checkAndAskForReview()
    }

    @IBAction func roll(_ sender: UIButton) {
        self.presenter.roll()
    }

    func getDiceNumberPicker() -> UIPickerView {
        return self.diceNumberPicker
    }

    func getDifficultyPicker() -> UIPickerView {
        return self.difficultyPicker
    }

    func getSuccessesNumber() -> UILabel {
        return self.successesNumber
    }

    func getSeeDetails() -> UIButton {
        return self.seeDetails
    }

    func getSuccessesLoadIndicator() -> UIActivityIndicatorView {
        return self.successesLoadIndicator
    }

    func getRollButton() -> UIButton {
        return self.rollButton
    }

    func getThresholdValue() -> UILabel {
        return self.thresholdValue
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.presenter.prepare(for: segue, sender: sender)
    }
}
