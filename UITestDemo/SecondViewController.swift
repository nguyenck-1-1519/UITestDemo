//
//  SecondViewController.swift
//  UITestDemo
//
//  Created by can.khac.nguyen on 4/22/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var contentLabel: UILabel!

    var message: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        if let message = message {
            contentLabel.text = message
        }
    }
}
