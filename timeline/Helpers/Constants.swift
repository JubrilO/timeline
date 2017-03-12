//
//  Constants.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 12/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func addTextSpacing(spacing: Double) {
        if let textString = text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
