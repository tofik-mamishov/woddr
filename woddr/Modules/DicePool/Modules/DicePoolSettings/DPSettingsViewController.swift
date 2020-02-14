//
//  DPSettingsViewController.swift
//  woddr
//
//  Created by Tofik Mamishov on 03/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit
import DeckTransition

class DPSettingsViewController: UIViewController, DPSettingsViewProtocol {

    @IBOutlet weak var diceDifficultyPicker: DeckPickerView!
    @IBOutlet weak var willpowerBoostStepper: StepperView!
    @IBOutlet weak var againPointSelector: AgainPointSelector!
    @IBOutlet weak var onesToCancelStepper: StepperView!
    @IBOutlet weak var onesToCancelContainer: UIStackView!

    var presenter: DPSettingsPresenterProtocol!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    var deckTransitioningDelegate: DeckTransitioningDelegate? {
        return self.transitioningDelegate as? DeckTransitioningDelegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.presenter.onClose()
        super.viewWillDisappear(animated)
    }

    @IBAction func close(_ sender: UIButton) {
        self.presenter.dismiss()
    }
}
