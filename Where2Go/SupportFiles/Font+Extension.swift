//
//  Font+Extension.swift
//  Where2Go
//
//  Created by Kiran on 15/08/23.
//

import Foundation
import UIKit

extension UIFont {

    public enum WTGFontType: String {
        case semibold = "-SemiBold"
        case regular = "-Regular"
        case light = "-Light"
        case bold = "-Bold"
        case medium = "-Medium"
    }

    static func WTGfont(_ type: WTGFontType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Montserrat\(type.rawValue)", size: size)!
    }

    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }

    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }

}
