//
//  ProgressIndicatorViewController.swift
//  GapstaffHealthCare
//
//  Created by Vasant Hugar on 26/06/18.
//  Copyright © 2018 Gapstaff. All rights reserved.
//

import UIKit

class ProgressIndicatorViewController: UIViewController {

    private weak var contentView: UIView?
    private weak var messageLabel: UILabel?
    private weak var activityIndicator: UIActivityIndicatorView?
    
    var message = ""
    var theme: ProgressIndicatorTheme = .light
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
		setAutolayoutForContentView()
		view.backgroundColor = .clear

		messageLabel?.text = message

		switch theme {
		case .dark:
			contentView?.backgroundColor = .darkGray
			messageLabel?.textColor = .white
			activityIndicator?.color = .white
			break

		case .light:
			contentView?.backgroundColor = .white
			messageLabel?.textColor = .black
			activityIndicator?.color = .black
			break

		case .custom(let backgoundColor, let contentColor):
			contentView?.backgroundColor = backgoundColor
			messageLabel?.textColor = contentColor
			activityIndicator?.color = contentColor
			break
		}
    }
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
        ProgressIndicator.hide()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	private func setAutolayoutForContentView() {
		let tempContentView = UIView()
		tempContentView.layer.cornerRadius = 5
		tempContentView.layer.masksToBounds = true
        self.view.addSubview(tempContentView)
        tempContentView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addConstraints([
			NSLayoutConstraint(item: tempContentView,
							   attribute: .centerX,
							   relatedBy: .equal,
							   toItem: self.view,
							   attribute: .centerX,
							   multiplier: 1,
							   constant: 0),

			NSLayoutConstraint(item: tempContentView,
							   attribute: .centerY,
							   relatedBy: .equal,
							   toItem: self.view,
							   attribute: .centerY,
							   multiplier: 1,
							   constant: 0),

			NSLayoutConstraint(item: tempContentView,
							   attribute: .leading,
							   relatedBy: .greaterThanOrEqual,
							   toItem: self.view,
							   attribute: .leading,
							   multiplier: 1,
							   constant: 50),
        ])
        self.contentView = tempContentView

		setAutolayoutForActivityIndicator()
	}

	private func setAutolayoutForActivityIndicator() {

		guard let contentView = self.contentView else { return }

		let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
		activityIndicatorView.hidesWhenStopped = true
		activityIndicatorView.startAnimating()
		contentView.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false

		let messageLabel = UILabel()
		messageLabel.numberOfLines = 0
		messageLabel.font = UIFont(name: "Helvetica", size: 12)
		contentView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

		contentView.addConstraints([
			NSLayoutConstraint(item: activityIndicatorView,
							   attribute: .centerX,
							   relatedBy: .equal,
							   toItem: contentView,
							   attribute: .centerX,
							   multiplier: 1,
							   constant: 0),

			NSLayoutConstraint(item: activityIndicatorView,
							   attribute: .leading,
							   relatedBy: .greaterThanOrEqual,
							   toItem: contentView,
							   attribute: .leading,
							   multiplier: 1,
							   constant: 15),

			NSLayoutConstraint(item: activityIndicatorView,
							   attribute: .top,
							   relatedBy: .equal,
							   toItem: contentView,
							   attribute: .top,
							   multiplier: 1,
							   constant: 15),

			NSLayoutConstraint(item: activityIndicatorView,
							   attribute: .bottom,
							   relatedBy: .equal,
							   toItem: messageLabel,
							   attribute: .top,
							   multiplier: 1,
							   constant: -7.5),

			NSLayoutConstraint(item: messageLabel,
							   attribute: .centerX,
							   relatedBy: .equal,
							   toItem: contentView,
							   attribute: .centerX,
							   multiplier: 1,
							   constant: 0),

			NSLayoutConstraint(item: messageLabel,
							   attribute: .leading,
							   relatedBy: .equal,
							   toItem: contentView,
							   attribute: .leading,
							   multiplier: 1,
							   constant: 10),

			NSLayoutConstraint(item: messageLabel,
							   attribute: .bottom,
							   relatedBy: .equal,
							   toItem: contentView,
							   attribute: .bottom,
							   multiplier: 1,
							   constant: -7.5),
		])
        self.activityIndicator = activityIndicatorView
		self.messageLabel = messageLabel
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
