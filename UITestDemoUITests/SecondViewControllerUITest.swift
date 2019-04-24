//
//  SecondViewControllerUITest.swift
//  UITestDemoUITests
//
//  Created by can.khac.nguyen on 4/24/19.
//  Copyright © 2019 can.khac.nguyen. All rights reserved.
//

import XCTest

class SecondViewControllerUITest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        let app = XCUIApplication()
        let textField = app.textFields["usernameTextfield"]
        textField.tap()
        textField.typeText("user1")
        let passwordTextField = app.textFields["passwordTextfield"]
        passwordTextField.tap()
        passwordTextField.typeText("1")
        app.buttons["Login"].tap()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCaseTableView() {
        let app = XCUIApplication()
        let tableView = app.tables["tableView"]
        XCTAssert(tableView.cells.count == 3)
        XCTAssert(tableView.cells.element(boundBy: 0).staticTexts["row 0"].exists)
    }

    func testExample() {
        
    }

}
