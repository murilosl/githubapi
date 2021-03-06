//
//  MainViewControllerTests.swift
//  GitHubAPP
//
//  Created by Murilo de Souza Lopes on 04/08/19.
//  Copyright (c) 2019 Murilo de Souza Lopes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import GitHubAPP
import XCTest
import Nimble
import Quick

class MainViewControllerTests: XCTestCase {
  // MARK: Subject under test

  var sut: MainViewController!
  var window: UIWindow!

  // MARK: Test lifecycle

  override func setUp() {
    super.setUp()
    window = UIWindow()
    setupMainViewController()
  }

  override func tearDown() {
    window = nil
    super.tearDown()
  }

  // MARK: Test setup

  func setupMainViewController() {
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: "Main", bundle: bundle)
    sut = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
  }

  func loadView() {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }

  // MARK: Test doubles

  class MainBusinessLogicSpy: MainBusinessLogic {
    func loadRepo(request: Main.Repo.Request) {

    }

    var item: Item?

    var doSomethingCalled = false

    func doSomething(request: Main.Something.Request) {
      doSomethingCalled = true
    }
  }

  // MARK: Tests

  func testShouldDoSomethingWhenViewIsLoaded() {
    // Given
    let spy = MainBusinessLogicSpy()
    sut.interactor = spy

    // When
    loadView()

    // Then
    XCTAssertTrue(spy.doSomethingCalled, "viewDidLoad() should ask the interactor to do something")
  }

  func testDisplaySomething() {
    // Given
    let viewModel = Main.Something.ViewModel(item: [])

    // When
    loadView()
    sut.displaySomething(viewModel: viewModel)

    // Then
    //XCTAssertEqual(sut.nameTextField.text, "", "displaySomething(viewModel:) should update the name text field")
  }
}
