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
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
    }

    // MARK: - Test Pull to Refresh
    func testPullToRefresh() {

        let firstCell = XCUIApplication().tables.cells.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element

        let start = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 30))
        start.press(forDuration: 3, thenDragTo: finish)
    }

    // MARK: - Test Go To Bottom

    func testGoToBottom() {
        let cv = XCUIApplication().tables.cells.element(boundBy: 0)

        let cb = cv.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))

        let scrollVector = CGVector(dx: 0.0, dy: -30.0)
        cb.press(forDuration: 0.5, thenDragTo: cb.withOffset(scrollVector))
    }

    // MARK: - Test First Cell Tap

    func testFirstCellTap() {
        let firstCell = XCUIApplication().tables.cells.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element
        firstCell.tap()
    }

}
