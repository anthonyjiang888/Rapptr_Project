//
//  TextFieldPadding.swift
//  iOSTest
//
//  Created by Anthony on 6/7/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import Foundation
import UIKit

class TextFieldPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 24,
        bottom: 0,
        right: 24
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
