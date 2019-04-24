//
//  ViewController.swift
//  UITestDemo
//
//  Created by can.khac.nguyen on 4/22/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginButton.layer.cornerRadius = loginButton.bounds.height / 2
        signUpButton.layer.cornerRadius = signUpButton.bounds.height / 2
        loginButton.clipsToBounds = true
        signUpButton.clipsToBounds = true
    }

    @IBAction func onLoginButtonDidClicked(_ sender: Any) {
        guard let username = usernameTextfield.text, !username.isEmpty else {
            showErrorAlert(withMessage: Constant.fillUsernameMessage)
            return
        }
        guard let password = passwordTextfield.text, !password.isEmpty else {
            showErrorAlert(withMessage: Constant.fillPasswordMessage)
            return
        }
        var isUserNameExist = false
        var indexUsername = -1
        for index in 0..<Constant.arrayUsername.count {
            if username == Constant.arrayUsername[index] {
                isUserNameExist = true
                indexUsername = index
                break;
            }
        }
        if !isUserNameExist {
            showErrorAlert(withMessage: Constant.usernameNotExist)
            return
        }
        if password != Constant.arrayPassword[indexUsername] {
            showErrorAlert(withMessage: Constant.wrongLoginInfo)
            return
        }
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController")
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func onSignUpButtonDidClicked(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        vc.message = "Sign up"
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func onTapGesture(_ sender: Any) {
        usernameTextfield.endEditing(true)
        passwordTextfield.endEditing(true)
    }
}

