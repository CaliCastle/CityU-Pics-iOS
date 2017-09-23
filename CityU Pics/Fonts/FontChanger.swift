//
//  FontChanger.swift
//  CityU Pics
//
//  Created by Cali Castle  on 9/19/17.
//  Copyright © 2017 Cali Castle . All rights reserved.
//

import UIKit

/// AppFont Enum, changes default font elegantly.
/// == Example: AppFont.Bold.size(15)
///
/// - Regular: Regular font
/// - Bold: Bold font
/// - Medium: Medium font
/// - Light: Light font
enum AppFont: String {
    case Regular = "Raleway-Regular"
    case Bold = "Raleway-Bold"
    case Medium = "Raleway-Medium"
    case Light = "Raleway-Light"
    
    func size(size: CGFloat) -> UIFont {
        return (UIFont(name: self.rawValue, size: size) != nil) ? UIFont(name: self.rawValue, size: size)! : UIFont()
    }
    
    func name() -> String {
        return self.rawValue
    }
}

// MARK: - UIFont Extension
extension UIFont {
    class var defaultFontFamily: String { return AppFont.Regular.name() }
}

// MARK: - UILabel Font Override
extension UILabel {
    public var substituteFontName : String {
        get {
            return self.font?.fontName ?? ""
        }
        set {
            if self.font == nil {
                self.font = UIFont(name: UIFont.defaultFontFamily, size: self.font?.pointSize ?? 15)
            }
        }
    }
}

// MARK: - UITextView Font Override
extension UITextView {
    public var substituteFontName : String {
        get {
            return self.font?.fontName ?? ""
        }
        set {
            if self.font == nil {
                self.font = UIFont(name: UIFont.defaultFontFamily, size: self.font?.pointSize ?? 15)
            }
        }
    }
}

// MARK: - UITextField Font Override
extension UITextField {
    public var substituteFontName : String {
        get {
            return self.font?.fontName ?? ""
        }
        set {
            if self.font == nil {
                self.font = UIFont(name: UIFont.defaultFontFamily, size: self.font?.pointSize ?? 15)
            }
        }
    }
}
