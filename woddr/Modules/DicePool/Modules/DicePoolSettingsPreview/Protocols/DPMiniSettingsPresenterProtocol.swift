//
//  DPMiniSettingsPresenterProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 07/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import UIKit

protocol DPMiniSettingsPresenterProtocol: class {
    var router: DPMiniSettingsRouterProtocol! { get set }

    func viewDidAppear()

    func drawTopBorder()

    func loadDiceDifficulty()

    func loadWillpowerBoost()

    func loadAgain()

    func fadeIn()

    func fadeOut()

    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}
