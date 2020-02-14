//
//  DPSettingsViewProtocol.swift
//  woddr
//
//  Created by Tofik Mamishov on 08/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//
import UIKit
import DeckTransition

protocol DPSettingsViewProtocol: class {
    var diceDifficultyPicker: DeckPickerView! { get }
    var willpowerBoostStepper: StepperView! { get }
    var againPointSelector: AgainPointSelector! { get }
    var onesToCancelStepper: StepperView! { get }
    var onesToCancelContainer: UIStackView! { get }

    var deckTransitioningDelegate: DeckTransitioningDelegate? { get }

    func dismiss(animated flag: Bool, completion: (() -> Void)?)
}
