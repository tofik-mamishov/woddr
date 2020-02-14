//
//  CritRulePresenterProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 02/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import UIKit

protocol CritRulePresenterProtocol: class {

    func critRule() -> CritRuleType

    func numberOfRowsInSection() -> Int

    func cell(for row: Int) -> UITableViewCell

    func selectCritRule(at indexPath: IndexPath)

    func willDisplay(cell: UITableViewCell, forRowAt indexPath: IndexPath)

    func viewWillAppear()
}
