//
//  CheckMarkControl.swift
//  woddr
//
//  Created by Tofik Mamishov on 30/06/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

/*
 CheckMarkControl: UIControl
 - label: UILabel
 - value: Int
 - checkMark: UIImage
 - delegate: CheckMarkControlDelegate

 AgainPointSelector: UIControl
 - checkMarks: [CheckMarkControl]
 */
import UIKit

class CheckMarkControl: UIControl {
    private let checkMarkSize = CGSize(width: 24, height: 24)
    private let labelSize = CGSize(width: 44, height: 44)
    private let margin = CGFloat(1.0)

    private var checkMark: UIImageView!
    private var label: UILabel!

    var value: Int = 0 {
        didSet {
            label.text = String(value)
            updateLabelOrigin()
        }
    }
    var isChecked = false {
        didSet {
            if isChecked {
                checkMark.image = #imageLiteral(resourceName: "tick-sign")
            } else {
                checkMark.image = nil
            }
        }
    }
    weak var delegate: CheckMarkControlDelegate?

    init() {
        let controlWidth = checkMarkSize.width + labelSize.width
        let controlSize = CGSize(width: controlWidth, height: labelSize.height)
        let frame = CGRect(origin: CGPoint(x: 0, y: 0), size: controlSize)
        super.init(frame: frame)
        initCheckMark()
        initLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initCheckMark() {
        let checkMarkY: CGFloat = (labelSize.height - checkMarkSize.height) / 2
        let checkMarkOrigin = CGPoint(x: 0, y: checkMarkY)
        let checkMarkFrame = CGRect(origin: checkMarkOrigin, size: checkMarkSize)
        checkMark = UIImageView(frame: checkMarkFrame)
        addSubview(checkMark)
    }

    private func initLabel() {
        let labelOrigin = CGPoint(x: 0, y: 0)
        let labelFrame = CGRect(origin: labelOrigin, size: labelSize)
        label = UILabel(frame: labelFrame)
        updateLabelOrigin()
        addSubview(label)
        label.font = UIFont(name: "Avenir-Heavy", size: 30.0)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.zPosition = -1.0
    }

    private func updateLabelOrigin() {
        let multiplier: CGFloat = value < 10 ? 0.5 : 0.85
        let labelXPosition = checkMarkSize.width * multiplier + margin
        let labelOrigin = CGPoint(x: labelXPosition, y: 0)
        label.frame.origin = labelOrigin
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.count == 1 else {
            return
        }
        guard let location = touches.first?.location(in: self) else {
            return
        }
        isHighlighted = label.frame.contains(location)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isHighlighted else {
            return
        }
        isChecked = true
        delegate?.checkMarkChecked(checkMark: self)
    }
}

protocol CheckMarkControlDelegate: class {
    func checkMarkChecked(checkMark: CheckMarkControl)
}
