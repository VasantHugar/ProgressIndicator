//
//  ProgressIndicatorView.swift
//  ProgressIndicator
//
//  Created by Vasant Hugar on 26/06/18.
//  Copyright © 2018 Gapstaff. All rights reserved.
//

import UIKit

class ProgressIndicatorView: UIView {

    private weak var contentView: UIView?
    private weak var messageLabel: UILabel?
    private weak var activityIndicator: UIActivityIndicatorView?

	private var tapGesture: UITapGestureRecognizer?
    
    var message = ""
    var theme: ProgressIndicatorTheme = .light

	override func draw(_ rect: CGRect) {
		super.draw(frame)
		initalSetUp()
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    private func initalSetUp() {
		setAutolayoutForContentView()

		backgroundColor = .clear
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

		tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))
		tapGesture?.numberOfTapsRequired = 3
		addGestureRecognizer(tapGesture!)
    }
    
	@objc func tapGestureAction(_ sender: UITapGestureRecognizer) {
        ProgressIndicator.hide()
    }

	private func setAutolayoutForContentView() {
		let tempContentView = UIView()
		tempContentView.layer.cornerRadius = 5
		tempContentView.layer.masksToBounds = true
        self.addSubview(tempContentView)
        tempContentView.translatesAutoresizingMaskIntoConstraints = false

        self.addConstraints([
			NSLayoutConstraint(item: tempContentView,
							   attribute: .centerX,
							   relatedBy: .equal,
							   toItem: self,
							   attribute: .centerX,
							   multiplier: 1,
							   constant: 0),

			NSLayoutConstraint(item: tempContentView,
							   attribute: .centerY,
							   relatedBy: .equal,
							   toItem: self,
							   attribute: .centerY,
							   multiplier: 1,
							   constant: 0),

			NSLayoutConstraint(item: tempContentView,
							   attribute: .leading,
							   relatedBy: .greaterThanOrEqual,
							   toItem: self,
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
