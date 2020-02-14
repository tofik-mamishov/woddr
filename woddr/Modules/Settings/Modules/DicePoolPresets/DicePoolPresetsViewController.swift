//
//  DicePoolPresetsViewController.swift
//  woddr
//
//  Created by Tofik Mamishov on 04/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class DicePoolPresetsViewController: UITableViewController, DicePoolPresetsViewProtocol {
    @IBOutlet weak var selectedCritRule: UILabel!
    @IBOutlet weak var cancelSuccessSwitch: UISwitch!
    @IBOutlet weak var roteActionsSwitch: UISwitch!
    @IBOutlet weak var showThresholdSwitch: UISwitch!
    @IBOutlet weak var selectedWillpowerBoost: UILabel!

    var presenter: DicePoolPresetsPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }

    @IBAction func switchCancelSuccess(_ sender: UISwitch) {
        self.presenter.saveCancelSuccessPreset(value: sender.isOn)
    }

    @IBAction func switchRoteActions(_ sender: UISwitch) {
        self.presenter.saveRoteActionsPreset(value: sender.isOn)
    }

    @IBAction func switchShowThreshold(_ sender: UISwitch) {
        presenter.saveShowThresholdPreset(value: sender.isOn)
    }

    func getSelectedCritRule() -> UILabel {
        return self.selectedCritRule
    }

    func getCancelSuccessSwitch() -> UISwitch {
        return self.cancelSuccessSwitch
    }

    func getRoteActionsSwitch() -> UISwitch {
        return self.roteActionsSwitch
    }
}
