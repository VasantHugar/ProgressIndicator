//
//  ProgressIndicatorConfigure.swift
//  cTimeSheet
//
//  Created by Vasant Hugar on 26/10/17.
//

import UIKit

fileprivate let INDICATOR_VIEW_TAG = 5000

class ProgressIndicatorConfigure {
    
	private lazy var progressIndicatorVC: ProgressIndicatorView? = {
        return ProgressIndicatorView()
    }()
    
    private lazy var rootVC: UIViewController? = {
        guard let window = UIApplication.shared.keyWindow, let rootVC = window.rootViewController else {
            return nil
        }
        return rootVC
    }()
}

extension ProgressIndicatorConfigure {
    
    /// Show indicator
    ///
    /// - Parameters:
    ///   - message: wih message
    ///   - onView: onView
    func show(_ message: String?, onView: UIView?, theme: ProgressIndicatorTheme?) {
        
        DispatchQueue.main.async {
            
            if let IVC = self.progressIndicatorVC {
                
                // Set Message Text
                IVC.message = message ?? ""
                
                // Set Theme
                IVC.theme = theme ?? .light
                
//                guard let contentView = IVC.view else { return }
                IVC.tag = INDICATOR_VIEW_TAG
                
                self.removeActiveView(from: onView)
                
                if let onView = onView {
                    IVC.frame = onView.bounds
                    onView.addSubview(IVC)
                }
				else if let rootVC = self.rootVC {
					IVC.frame = rootVC.view.bounds
					rootVC.view.addSubview(IVC)
				}
            }
        }
    }
    
    /// Hide indicator fuctions
    ///
    /// - Parameter fromView: from View is optional
    func hide(from view: UIView?) {
        DispatchQueue.main.async {
            self.removeActiveView(from: view)
        }
    }
}

private extension ProgressIndicatorConfigure {
    /// Remove Active view
    ///
    /// - Parameter view: UIView
    func removeActiveView(from view: UIView?) {
        if let fromView = view, let view = fromView.activeContentView {
            view.removeFromSuperview()
        }
        else {
            if let rootVC = rootVC, let view = rootVC.view.activeContentView {
                view.removeFromSuperview()
            }
        }
    }
}

private extension UIView {
    var activeContentView: UIView? {
        return viewWithTag(INDICATOR_VIEW_TAG)
    }
}
