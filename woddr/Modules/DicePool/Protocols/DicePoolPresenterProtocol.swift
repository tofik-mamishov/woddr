//
//  DicePoolPresenterProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 09/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//
import UIKit

protocol DicePoolPresenterProtocol: class {

    func getRollResults() -> [[RollResult]]

    func roll()

    func viewDidLoad()

    func viewWillAppear()

    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}
