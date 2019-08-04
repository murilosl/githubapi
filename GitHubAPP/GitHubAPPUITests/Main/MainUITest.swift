//
//  Main.swift
//  GitHubAPPUITests
//
//  Created by Murilo de Souza Lopes on 04/08/19.
//  Copyright © 2019 Murilo de Souza Lopes. All rights reserved.
//

import XCTest

class MainUITest: XCTestCase {

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

    func testPullToRefresh(){

        let firstCell = XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element
        
        let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 30))
        start.press(forDuration: 3, thenDragTo: finish)
    }
    
    func testGoToBottom(){
        let cv = XCUIApplication().collectionViews.element(boundBy:0)
        
        let cb = cv.coordinate(withNormalizedOffset:CGVector(dx: 0, dy: 0))
        
        let scrollVector = CGVector(dx: 0.0, dy: -30.0)
        cb.press(forDuration: 0.5, thenDragTo: cb.withOffset(scrollVector))
    }
    
    func testFirstCellTap(){
        let firstCell = XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element
        firstCell.tap()
    }

}
