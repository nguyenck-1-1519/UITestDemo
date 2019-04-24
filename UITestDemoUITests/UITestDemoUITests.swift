//
//  UITestDemoUITests.swift
//  UITestDemoUITests
//
//  Created by can.khac.nguyen on 4/22/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import XCTest

class UITestDemoUITests: XCTestCase {

    let fillUsernameMessage = "Please fill user name, before you login"
    let fillPasswordMessage = "Please fill password before you login"
    let wrongLoginInfo = "Username or Password is incorrect, please try again"
    let usernameNotExist = "Username is not exist, please try again"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCaseDontFillAnything() {
        let app = XCUIApplication()
        app.buttons["Login"].tap()

        XCTAssertEqual(app.alerts.element.label, "Error")
        XCTAssert(app.alerts.element.staticTexts[fillUsernameMessage].exists)
    }

    func testCaseFillWrongUsername() {
        let app = XCUIApplication()
        let nameTextField = app.textFields["usernameTextfield"]
        nameTextField.tap()
        nameTextField.typeText("user3")
        let passwordTextField = app.textFields["passwordTextfield"]
        passwordTextField.tap()
        passwordTextField.typeText("1kaasdf")
        app.buttons["Login"].tap()

        XCTAssertEqual(app.alerts.element.label, "Error")
        XCTAssert(app.alerts.element.staticTexts[usernameNotExist].exists)
    }

    func testCaseDontFillPassword() {
        let app = XCUIApplication()
        let textField = app.textFields["usernameTextfield"]
        textField.tap()
        textField.typeText("user1")
        app.buttons["Login"].tap()

        XCTAssertEqual(app.alerts.element.label, "Error")
        XCTAssert(app.alerts.element.staticTexts[fillPasswordMessage].exists)
    }

    func testCaseWrongPassword() {
        let app = XCUIApplication()
        let textField = app.textFields["usernameTextfield"]
        textField.tap()
        textField.typeText("user1")
        let passwordTextField = app.textFields["passwordTextfield"]
        passwordTextField.tap()
        passwordTextField.typeText("1kaasdf")
        app.buttons["Login"].tap()

        XCTAssertEqual(app.alerts.element.label, "Error")
        XCTAssert(app.alerts.element.staticTexts[wrongLoginInfo].exists)
    }

    func testCaseLoginSuccess() {
        let app = XCUIApplication()
        let textField = app.textFields["usernameTextfield"]
        textField.tap()
        textField.typeText("user1")
        let passwordTextField = app.textFields["passwordTextfield"]
        passwordTextField.tap()
        passwordTextField.typeText("1")
        app.buttons["Login"].tap()

        XCTAssert(app.staticTexts["Login success"].exists)
    }


    func testExample() {
    }

}
