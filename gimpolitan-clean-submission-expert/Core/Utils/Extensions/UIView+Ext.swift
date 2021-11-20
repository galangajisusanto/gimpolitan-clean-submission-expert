//
//  UIView+Ext.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 08/11/21.
//

import Foundation
import UIKit

extension UIView {
    func setupCorners(cornerRadius: CornerOptions) {
        switch cornerRadius {
        case .small:
            layer.cornerRadius = 6
        case .medium:
            layer.cornerRadius = 12
        case .large:
            layer.cornerRadius = 33
        case .circle:
            layer.cornerRadius = frame.height / 2
        }
        let borderColor: UIColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0)
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
    }
}

extension UILabel {
    func addTrailing(image: UIImage, text: String) {
        let attachment = NSTextAttachment()
        attachment.image = image
        let attachmentString = NSAttributedString(attachment: attachment)
        let string = NSMutableAttributedString(string: text, attributes: [:])
        string.append(attachmentString)
        self.attributedText = string
    }
    func addLeading(image: UIImage, text: String) {
        let attachment = NSTextAttachment()
        attachment.image = image
        let attachmentString = NSAttributedString(attachment: attachment)
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentString)
        let string = NSMutableAttributedString(string: text, attributes: [:])
        mutableAttributedString.append(string)
        self.attributedText = mutableAttributedString
    }
}

enum CornerOptions {
    case small
    case medium
    case large
    case circle
}
