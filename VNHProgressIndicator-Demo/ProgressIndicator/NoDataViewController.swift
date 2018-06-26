//
//  NoDataViewController.swift
//  GapStaffEmployee
//
//  Created by Vasant Hugar on 23/02/18.
//  Copyright © 2018 Vasant Indpro. All rights reserved.
//

import UIKit

class NoDataViewController: UIViewController {
    
    @IBOutlet fileprivate weak var messageLabel: UILabel!
    var message = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        messageLabel.text = message
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

fileprivate let INDICATOR_VIEW_TAG = 5999

func showError(_ message: String, onView: UIView) {
    setup(message, onView: onView)
}

/// Set up show indicator
///
/// - Parameters:
///   - message: wih message
///   - onView: onView
fileprivate func setup(_ message: String, onView: UIView) {
    
    DispatchQueue.main.async {
        
        if let IVC = UIStoryboard(name: "ProgressIndicator", bundle: nil).instantiateViewController(withIdentifier: "NoDataViewController") as? NoDataViewController {
            
            IVC.modalPresentationStyle = .overCurrentContext
            IVC.modalTransitionStyle = .crossDissolve
            
            // Set Message Text
            IVC.message = message
        
            guard let contentView = IVC.view else { return }
            contentView.tag = INDICATOR_VIEW_TAG
            
            if let previousView = onView.viewWithTag(INDICATOR_VIEW_TAG) {
                previousView.removeFromSuperview()
            }
            contentView.frame = onView.bounds
            onView.addSubview(contentView)
        }
    }
}

func hideErrorMessage(fromView view: UIView) {
    setupHide(fromView: view)
}

/// Setup hide indicator fuctions
///
/// - Parameter fromView: from View
fileprivate func setupHide(fromView: UIView) {
    DispatchQueue.main.async {
        
        if let view = fromView.viewWithTag(INDICATOR_VIEW_TAG) {
            view.removeFromSuperview()
        }
    }
}

