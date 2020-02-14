//
//  DetailsPresenterProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 18/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//
import UIKit

protocol DetailsPresenterProtocol: class {

    var rollResults: [[RollResult]]! { get set }

    func titleForHeader(in section: Int) -> String

    func setup(headerView: UITableViewHeaderFooterView)

    func setup(cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell
}
