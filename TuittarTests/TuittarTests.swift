//
//  TuittarTests.swift
//  TuittarTests
//
//  Created by TEN MATSUMOTO on 15/10/2022.
//

import XCTest
@testable import Tuittar

final class TuittarTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testButtonAction() throws {
        // This test checks character limit (i.e. 140). Source code from ComposeTweetController.buttonAction()
        
        func limitTest() -> Bool {
            let bodyTextField = "Apple Inc. is an American multinational technology company headquartered in Cupertino, California, United States." // ← Put some text.
            if bodyTextField.count > 140 {
                return false
            } else {
                return true
            }
        }
        
        XCTAssertTrue(limitTest())
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
