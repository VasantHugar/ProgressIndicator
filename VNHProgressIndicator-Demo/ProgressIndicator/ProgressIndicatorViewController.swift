//
//  ProgressIndicatorViewController.swift
//  GapstaffHealthCare
//
//  Created by Vasant Hugar on 26/06/18.
//  Copyright © 2018 Gapstaff. All rights reserved.
//

import UIKit

class ProgressIndicatorViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet fileprivate weak var messageLabel: UILabel!
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    
    var message = ""
    var theme: ProgressIndicatorTheme = .light
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        messageLabel.text = message
        
        if theme == .dark {
            contentView.backgroundColor = .darkGray
            messageLabel.textColor = .white
            activityIndicator.color = .white
        }
        else {
            contentView.backgroundColor = UIColor(rgbValue: 0xEBEBEB)
            messageLabel.textColor = .black
            activityIndicator.color = .black
        }
    }
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        ProgressIndicator.hide()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIColor {
    
    convenience init(rgbValue: UInt) {
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
