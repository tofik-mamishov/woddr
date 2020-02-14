//
//  DPMiniSettingsViewController.swift
//  woddr
//
//  Created by Tofik Mamishov on 03/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class DPMiniSettingsViewController: UIViewController, DPMiniSettingsViewProtocol,
UIGestureRecognizerDelegate {

    @IBOutlet var gestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var diceDifficultyLabel: UILabel!
    @IBOutlet weak var againLabel: UILabel!
    //@IBOutlet weak var willpowerBoostLabel: UILabel!

    var presenter: DPMiniSettingsPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.gestureRecognizer.delegate = self
        self.presenter.drawTopBorder()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.presenter.viewDidAppear()
        //self.presenter.loadWillpowerBoost()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.presenter.fadeOut()
        self.presenter.router.prepare(for: segue, sender: sender)
    }
}
