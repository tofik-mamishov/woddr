//
//  DeckPickerView.swift
//  woddr
//
//  Created by Tofik Mamishov on 08/03/2019.
//  Copyright © 2019 Tofik Mamishov. All rights reserved.
//

import UIKit
import DeckTransition

class DeckPickerView: UIPickerView, UIGestureRecognizerDelegate {
    weak var deckTransitioningDelegate: DeckTransitioningDelegate?

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override func awakeFromNib() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
        pan.maximumNumberOfTouches = 1
        pan.minimumNumberOfTouches = 1
        pan.delegate = self
        self.addGestureRecognizer(pan)
    }

    @objc func tapHandler(_ panRecognizer: UITapGestureRecognizer) {
        if .began == panRecognizer.state {
            self.deckTransitioningDelegate?.isSwipeToDismissEnabled = false
        } else if .ended == panRecognizer.state {
            self.deckTransitioningDelegate?.isSwipeToDismissEnabled = true
        }
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
