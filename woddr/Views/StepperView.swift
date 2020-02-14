//
//  StepperView.swift
//  woddr
//
//  Created by Tofik Mamishov on 23/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit

class StepperView: UIControl {
    private let widthImg = CGFloat(30)
    private let heightImg = CGFloat(30)

    private var decrementButton: UIButton!
    private var valueLabel: UILabel!
    private var incrementButton: UIButton!

    var min: Int = 0
    var max: Int = 99
    var step: Int = 1
    var value: Int = 0

    override func draw(_ rect: CGRect) {
        setupStepperView()
        setupDecrementButton()
        setupValueLabel()
        setupIncrementButton()
    }

    private func setupStepperView() {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: widthImg * 4).isActive = true
        heightAnchor.constraint(equalToConstant: heightImg).isActive = true
        if let parent = superview {
            self.centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
            self.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
        }
    }

    private func setupDecrementButton() {
        decrementButton = UIButton(type: UIButton.ButtonType.custom)
        decrementButton.setImage(UIImage(named: "minus"), for: .normal)
        addSubview(decrementButton)
        decrementButton.translatesAutoresizingMaskIntoConstraints = false
        decrementButton.widthAnchor.constraint(equalToConstant: widthImg - 2).isActive = true
        decrementButton.heightAnchor.constraint(equalToConstant: heightImg).isActive = true
        decrementButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        decrementButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        decrementButton.tintColor = UIColor.red
        decrementButton.addTarget(self, action: #selector(decrease), for: .touchUpInside)
        decrementButton.isEnabled = isEnabled && !(value == 0)
    }

    private func setupValueLabel() {
        valueLabel = UILabel()
        addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.text = String(value)
        valueLabel.textColor = .white
        valueLabel.font = UIFont(name: "Avenir-Heavy", size: 35.0)
        valueLabel.textAlignment = .center
        valueLabel.widthAnchor.constraint(equalToConstant: widthImg * 2).isActive = true
        valueLabel.heightAnchor.constraint(equalToConstant: heightImg).isActive = true
        valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        valueLabel.isEnabled = isEnabled
    }

    private func setupIncrementButton() {
        incrementButton = UIButton(type: UIButton.ButtonType.custom)
        incrementButton.setImage(UIImage(named: "plus"), for: .normal)
        addSubview(incrementButton)
        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        incrementButton.widthAnchor.constraint(equalToConstant: widthImg).isActive = true
        incrementButton.heightAnchor.constraint(equalToConstant: heightImg).isActive = true
        incrementButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        incrementButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        incrementButton.tintColor = UIColor.red
        incrementButton.addTarget(self, action: #selector(increase), for: .touchUpInside)
        incrementButton.isEnabled = isEnabled && !(value == max)
    }

    @objc private func decrease(sender: UIButton!) {
        guard value > 0 else {
            return
        }
        incrementButton.isEnabled = true
        value -= step
        valueLabel.text = String(value)
        decrementButton.isEnabled = !(value == 0)
        sendActions(for: .valueChanged)
    }

    @objc private func increase(sender: UIButton!) {
        guard value < max else {
            incrementButton.isEnabled = false
            return
        }
        decrementButton.isEnabled = true
        value += step
        valueLabel.text = String(value)
        incrementButton.isEnabled = !(value == max)
        sendActions(for: .valueChanged)
    }
}
