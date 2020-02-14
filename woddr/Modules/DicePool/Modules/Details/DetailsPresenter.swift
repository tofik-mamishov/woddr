//
//  DetailsPresenter.swift
//  woddr
//
//  Created by Tofik Mamishov on 18/11/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//
import UIKit

class DetailsPresenter: DetailsPresenterProtocol {
    private static let defaultCellTextColor = UIColor(red: 0.557, green: 0.557,
                                                          blue: 0.557, alpha: 1.0)
    private weak var view: DetailsViewProtocol!
    private var interactor: DetailsInteractorProtocol

    var rollResults: [[RollResult]]!

    init(view: DetailsViewProtocol, interactor: DetailsInteractorProtocol) {
        self.view = view
        self.rollResults = [[RollResult]]()
        self.interactor = interactor
    }

    func titleForHeader(in section: Int) -> String {
        return "Throw #\(section + 1)"
    }

    func setup(headerView: UITableViewHeaderFooterView) {
        headerView.textLabel?.textColor = UIColor.white
        let fontSize: CGFloat = (headerView.textLabel?.font.pointSize)!
        headerView.textLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight.bold)
        headerView.backgroundView?.backgroundColor = UIColor.black
    }

    func setup(cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
        guard let rollResult = self.rollResults?[indexPath.section][indexPath.row] else {
            fatalError("No roll result")
        }
        cell.textLabel?.text = "\(rollResult.value)" + (self.interactor.critMark(for: rollResult) ?? "")
        cell.textLabel?.textColor = textColor(by: rollResult.type)
        return cell
    }

    private func textColor(by rollResultType: RollResultType) -> UIColor {
        switch rollResultType {
        case .success, .doubleSuccess, .again:
            return UIColor.white
        case .fail, .one, .rote:
            return DetailsPresenter.defaultCellTextColor
        }
    }
}
