//
//  CheckMarkCell.swift
//  woddr
//
//  Created by Tofik Mamishov on 13/01/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class CheckMarkCell: UITableViewCell {
    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var value: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        self.checkMark.isHidden = !selected
    }

}
