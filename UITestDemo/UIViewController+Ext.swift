//
//  UIViewController+Ext.swift
//  UITestDemo
//
//  Created by can.khac.nguyen on 4/22/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorAlert(withMessage message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
