//
//  SPTextField+ViewModifiers.swift
//  SPTextField
//
//  Created by Sithija Nelusha on 08/02/2021.
//

import SwiftUI
import UIKit

@available(iOS 13.0, *)
extension SPTextField {
    public func fontFromUIFont(_ font: UIFont?) -> SPTextField {
        var view = self
        view.font = font
        return view
    }
    
    @available(iOS 13, *)
    public func foregroundColor(_ color: Color?) -> SPTextField {
        var view = self
        if let color = color {
            view.foregroundColor = UIColor.from(color: color)
        }
        return view
    }
    
    @available(iOS 13, *)
    public func accentColor(_ accentColor: Color?) -> SPTextField {
        var view = self
        if let accentColor = accentColor {
            view.accentColor = UIColor.from(color: accentColor)
        }
        return view
    }
    
    public func multilineTextAlignment(_ alignment: TextAlignment) -> SPTextField {
        var view = self
        switch alignment {
            case .leading:
                view.textAlignment = layoutDirection ~= .leftToRight ? .left : .right
            case .trailing:
                view.textAlignment = layoutDirection ~= .leftToRight ? .right : .left
            case .center:
                view.textAlignment = .center
        }
        return view
    }
    
    public func textContentType(_ textContentType: UITextContentType?) -> SPTextField {
        var view = self
        view.contentType = textContentType
        return view
    }
    
    public func disableAutocorrection(_ disable: Bool?) -> SPTextField {
        var view = self
        if let disable = disable {
            view.autocorrection = disable ? .no : .yes
        } else {
            view.autocorrection = .default
        }
        return view
    }
    
    public func autocapitalization(_ style: UITextAutocapitalizationType) -> SPTextField {
        var view = self
        view.autocapitalization = style
        return view
    }
    
    public func keyboardType(_ type: UIKeyboardType) -> SPTextField {
        var view = self
        view.keyboardType = type
        return view
    }
    
    public func returnKeyType(_ type: UIReturnKeyType) -> SPTextField {
        var view = self
        view.returnKeyType = type
        return view
    }
    
    public func isSecure(_ isSecure: Bool) -> SPTextField {
        var view = self
        view.isSecure = isSecure
        return view
    }
    
    public func clearsOnBeginEditing(_ shouldClear: Bool) -> SPTextField {
        var view = self
        view.clearsOnBeginEditing = shouldClear
        return view
    }
    
    public func clearsOnInsertion(_ shouldClear: Bool) -> SPTextField {
        var view = self
        view.clearsOnInsertion = shouldClear
        return view
    }
    
    public func showsClearButton(_ showsButton: Bool) -> SPTextField {
        var view = self
        view.clearButtonMode = showsButton ? .always : .never
        return view
    }
    
    public func disabled(_ disabled: Bool) -> SPTextField {
        var view = self
        view.isUserInteractionEnabled = !disabled
        return view
    }
    
    public func passwordRules(_ rules: UITextInputPasswordRules) -> SPTextField {
        var view = self
        view.isSecure = true
        view.passwordRules = rules
        return view
    }
    
    public func smartDashes(_ smartDashes: Bool? = nil) -> SPTextField {
        var view = self
        if let smartDashes = smartDashes { 
            view.smartDashesType = smartDashes ? .yes : .no
        }
        return view
    }
    
    public func smartInsertDelete(_ smartInsertDelete: Bool? = nil) -> SPTextField {
        var view = self
        if let smartInsertDelete = smartInsertDelete {
            view.smartInsertDeleteType = smartInsertDelete ? .yes : .no
        }
        return view
    }
    
    public func smartQuotes(_ smartQuotes: Bool? = nil) -> SPTextField {
        var view = self
        if let smartQuotes = smartQuotes {
            view.smartQuotesType = smartQuotes ? .yes : .no
        }
        return view
    }
    
    public func spellChecking(_ spellChecking: Bool? = nil) -> SPTextField {
        var view = self
        if let spellChecking = spellChecking {
            view.spellCheckingType = spellChecking ? .yes : .no
        }
        return view
    }
    
    public func onEditingBegan(perform action: (() -> Void)? = nil) -> SPTextField {
        var view = self
        if let action = action {
            view.didBeginEditing = action 
        }
        return view
    }
    
    public func onEdit(perform action: (() -> Void)? = nil) -> SPTextField {
        var view = self
        if let action = action {
            view.didChange = action
        }
        return view
    }
    
    public func onEditingEnded(perform action: (() -> Void)? = nil) -> SPTextField {
        var view = self
        if let action = action {
            view.didEndEditing = action
        }
        return view
    }
    
    public func onReturn(perform action: (() -> Void)? = nil) -> SPTextField {
        var view = self
        if let action = action {
            view.shouldReturn = action
        }
        return view
    }
    
    public func onClear(perform action: (() -> Void)? = nil) -> SPTextField {
        var view = self
        if let action = action {
            view.shouldClear = action
        }
        return view
    }
    
    public func style(height: CGFloat = 50, backgroundColor: Color? = nil, accentColor: Color = Color(red: 0.30, green: 0.76, blue: 0.85), font inputFont: UIFont? = nil, leadingPadding: CGFloat = 25, cornerRadius: CGFloat = 6, hasShadow: Bool = false, image: Image? = nil) -> some View {
        var darkMode: Bool { colorScheme == .dark }
        
        let cursorColor: Color = accentColor
        let height: CGFloat = height
        let leadingPadding: CGFloat = leadingPadding
        
        var backgroundGray: Double { darkMode ? 0.25 : 0.95 }
        var backgroundColor: Color {
            if backgroundColor != nil {
                return backgroundColor!
            } else {
                return .init(white: backgroundGray)
            }
        }
        
        var shadowOpacity: Double { (designEditing && hasShadow) ? 0.5 : 0 }
        var shadowGray: Double { darkMode ? 0.8 : 0.5 }
        var shadowColor: Color { Color(white: shadowGray).opacity(shadowOpacity) }
        
        var borderColor: Color {
            designEditing && darkMode ? .init(white: 0.8) : .clear
        }
        
        var font: UIFont {
            if let inputFont = inputFont {
                return inputFont
            } else {
                let fontSize: CGFloat = 20
                let systemFont = UIFont.systemFont(ofSize: fontSize)
                if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
                    return UIFont(descriptor: descriptor, size: fontSize)
                } else {
                    return systemFont
                }
            }
        }
        
        return (
            ZStack {
                HStack {
                    if let image = image {
                        image
                    }
                    self
                        .accentColor(cursorColor)
                        .fontFromUIFont(font)
                }
                .padding(.horizontal, leadingPadding)
            }
            .frame(height: height)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(borderColor))
            .padding(.horizontal, leadingPadding)
            .shadow(color: shadowColor, radius: 5, x: 0, y: 4)
        )
    }
    
    @available(*, deprecated, renamed: "fontFromUIFont", message: "At this time, Apple will not let us parse a `Font` object❗️ Please use `.fontFromUIFont(_:)` instead.")
    public func font(_ font: Font?) -> some View { return EmptyView() }
}


