//
//  InfoViewController.swift
//  woddr
//
//  Created by Tofik Mamishov on 13/02/2018.
//  Copyright © 2018 Tofik Mamishov. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var version: UILabel!
    @IBOutlet weak var appDescription: UITextView!
    @IBOutlet weak var iconsAuthorRef: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        drawVersion()
        drawHyperLinksInAppDescription()
        drawHyperlinksInIconsAuthor()
    }

    func drawVersion() {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        guard let versionText = version as? String else {
            return
        }
        self.version.text = "woddr \(versionText)"
    }

    func drawHyperLinksInAppDescription() {
        appDescription.delegate = self
        guard let attributedText = appDescription.attributedText else {
            return
        }
        let attributedString = NSMutableAttributedString()
        attributedString.setAttributedString(attributedText)
        let address = "https://en.wikipedia.org/wiki/World_of_Darkness" +
            "#Chronicles_of_Darkness_(formerly_New_World_of_Darkness)"
        let url = URL(string: address)!
        attributedString.addAttribute(.link, value: url, range: NSRange(location: 35, length: 21))
        appDescription.attributedText = attributedString
    }

    func drawHyperlinksInIconsAuthor() {
        iconsAuthorRef.delegate = self
        guard let attributedText = iconsAuthorRef.attributedText else {
            return
        }
        let attributedString = NSMutableAttributedString()
        attributedString.setAttributedString(attributedText)
        attributedString.addAttribute(.link, value: URL(string: "https://www.flaticon.com/authors/freepik")!,
                                       range: NSRange(location: 22, length: 7))
        attributedString.addAttribute(.link, value: URL(string: "https://www.flaticon.com")!,
                                       range: NSRange(location: 35, length: 16))
        attributedString.addAttribute(.link, value: URL(string: "https://openclipart.org/user-detail/wirelizard")!,
                                      range: NSRange(location: 52, length: 10))
        attributedString.addAttribute(.link, value: URL(string: "https://openclipart.org")!,
                                      range: NSRange(location: 68, length: 19))
        iconsAuthorRef.attributedText = attributedString
    }

    func textView(_ textView: UITextView, shouldInteractWith URL: URL,
                  in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:])
        return false
    }
}
