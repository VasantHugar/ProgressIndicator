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
        
        ProgressIndicator.show()
        perform(#selector(hide), with: nil, afterDelay: 5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func hide() {
        ProgressIndicator.hide()
    }
}

