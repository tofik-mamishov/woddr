//
//  DPMiniSettingsViewProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 07/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import UIKit

protocol DPMiniSettingsViewProtocol: class {
    var view: UIView! { get set }

    var diceDifficultyLabel: UILabel! { get }
    var againLabel: UILabel! { get }
    //var willpowerBoostLabel: UILabel! { get set }
}
