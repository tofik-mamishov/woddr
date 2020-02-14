//
//  File.swift
//  woddr
//
//  Created by Tofik Mamishov on 05/07/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class AgainPointSelector: UIControl, CheckMarkControlDelegate {
    private let againPoints = [10, 9, 8]

    private var checkMarks = [CheckMarkControl]()

    var value: Int = 10 {
        didSet {
            updateCheckMarkPosition()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initCheckMarks()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initCheckMarks()
        updateLayerFrames()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateLayerFrames()
    }

    func initCheckMarks() {
        for index in 0..<againPoints.count {
            let againPoint = againPoints[index]
            let checkMark = CheckMarkControl()
            addSubview(checkMark)
            checkMark.value = againPoint
            checkMark.isChecked = againPoint == value
            checkMark.delegate = self
            checkMarks.append(checkMark)
        }
    }

    func updateLayerFrames() {
        for index in 0..<checkMarks.count {
            let checkMark = checkMarks[index]
            let checkMarkXPosition = frame.width - CGFloat(index + 1) * checkMark.frame.width
            let checkMarkOrigin = CGPoint(x: checkMarkXPosition, y: 0)
            checkMark.frame.origin = checkMarkOrigin
        }
    }

    func checkMarkChecked(checkMark: CheckMarkControl) {
        value = checkMark.value
        sendActions(for: .valueChanged)
    }

    private func updateCheckMarkPosition() {
        checkMarks.forEach({ element in
            element.isChecked = element.value == value
        })
    }
}
