//
//  WillpowerBoostTableManager.swift
//  woddr
//
//  Created by Tofik Mamishov on 17/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class WillpowerBoostTableManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    var didSelectRowHandler: ((_ : WillpowerBoostType) -> Void)?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WillpowerBoostType.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "willpowerBoostCell")
            as? WillpowerBoostCell else {
                fatalError("No reusable cell with identifier: willpowerBoostCell")
        }
        cell.boostType = WillpowerBoostType.allCases[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectRowHandler?(WillpowerBoostType.allCases[indexPath.row])
    }
}
