//
//  ViewController.swift
//  VNHProgressIndicator-Demo
//
//  Created by Vasant Hugar on 26/06/18.
//  Copyright © 2018 Vasant Hugar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        start()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	@IBAction func startAction(_ sender: Any) {
		start()
	}

	func start() {
		ProgressIndicator.show("Loading...",
							   theme: .custom(backgoundColor: .yellow, contentColor: .red))
		perform(#selector(stop), with: nil, afterDelay: 5)
	}

    @objc func stop() {
        ProgressIndicator.hide()
    }
}

