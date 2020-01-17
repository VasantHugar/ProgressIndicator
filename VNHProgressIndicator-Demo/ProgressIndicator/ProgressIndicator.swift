//
//  ProgressIndicator.swift
//  ProgressIndicator
//
//  Created by Vasant Hugar on 26/06/18.
//  Copyright © 2018 Gapstaff. All rights reserved.
//

import UIKit

fileprivate let PI = ProgressIndicatorConfigure()

struct ProgressIndicator {
    
    /// Show Indicator without message
    static func show() {
        PI.show(nil, onView: nil, theme: nil)
    }
    
    /// Show Indicator
    ///
    /// - Parameter view: Onview
    static func show(onView view: UIView) {
        PI.show(nil, onView: view, theme: nil)
    }
    
    /// Show Indicator without message
    ///
    /// - Parameter theme: ProgressIndicatorTheme
    static func show(_ theme: ProgressIndicatorTheme) {
        PI.show(nil, onView: nil, theme: theme)
    }
    
    /// Show Indicator
    ///
    /// - Parameter:
    ///   - view: Onview
    ///   - theme: ProgressIndicatorTheme
    static func show(onView view: UIView, theme: ProgressIndicatorTheme) {
        PI.show(nil, onView: view, theme: theme)
    }
    
    /// Show Indicator with message
    ///
    /// - Parameter message: Message text
    static func show(_ message: String) {
        PI.show(message, onView: nil, theme: nil)
    }
    
    /// Show Indicator with message
    ///
    /// - Parameter:
    ///   - message: Message text
    ///   - theme: ProgressIndicatorTheme
    static func show(_ message: String, theme: ProgressIndicatorTheme) {
        PI.show(message, onView: nil, theme: theme)
    }
    
    /// Show Indicator
    ///
    /// - Parameters:
    ///   - message: with message and
    ///   - onView: onView
    static func show(_ message: String, onView: UIView) {
        PI.show(message, onView: onView, theme: nil)
    }
    
    /// Show Indicator
    ///
    /// - Parameters:
    ///   - message: with message and
    ///   - onView: onView
    ///   - theme: ProgressIndicatorTheme
    static func show(_ message: String, onView: UIView, theme: ProgressIndicatorTheme) {
        PI.show(message, onView: onView, theme: theme)
    }
    
    /// Hide Indicator
    static func hide() {
        PI.hide(from: nil)
    }
    
    /// Hide Indicator
    ///
    /// - Parameter view: From view
    static func hide(fromView view: UIView) {
        PI.hide(from: view)
    }
}
