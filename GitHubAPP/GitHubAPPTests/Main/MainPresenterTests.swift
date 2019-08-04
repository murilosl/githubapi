//
//  MainPresenterTests.swift
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

class MainPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: MainPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupMainPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupMainPresenter()
  {
    sut = MainPresenter()
  }
  
  // MARK: Test doubles
  
  class MainDisplayLogicSpy: MainDisplayLogic
  {
    var displaySomethingCalled = false
    
    func displaySomething(viewModel: Main.Something.ViewModel)
    {
      displaySomethingCalled = true
    }
  }
  
  // MARK: Tests
  
  func testPresentSomething()
  {
    // Given
    let spy = MainDisplayLogicSpy()
    sut.viewController = spy
    let response = Main.Something.Response()
    
    // When
    sut.presentSomething(response: response)
    
    // Then
    XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
  }
}
