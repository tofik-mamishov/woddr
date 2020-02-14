//
//  SetupObject.swift
//  woddr
//
//  Created by Tofik Mamishov on 10/02/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class SetupObject: NSObject {
    override func awakeFromNib() {
        let font = UIFont(name: "Avenir-Medium", size: 17.0)
        UIBarButtonItem.appearance()
            .setTitleTextAttributes([NSAttributedString.Key.font: font!], for: .normal)
    }
}
