//
//  UIImageExtesion.swift
//  woddr
//
//  Created by Tofik Mamishov on 23/03/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

import UIKit

extension UIImage {
    func scaleTo(_ newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
