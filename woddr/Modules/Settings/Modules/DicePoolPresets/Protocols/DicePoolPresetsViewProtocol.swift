//
//  DicePoolPresetsViewProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 12/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import UIKit

protocol DicePoolPresetsViewProtocol: class {
    var selectedWillpowerBoost: UILabel! { get }

    var showThresholdSwitch: UISwitch! { get }

    func getSelectedCritRule() -> UILabel

    func getCancelSuccessSwitch() -> UISwitch

    func getRoteActionsSwitch() -> UISwitch
}
