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

    // "testValidate" checks character limit (i.e. 140). Source code from ComposeTweetController.buttonAction()
    func testValidate_1() throws {
        let ctc = ComposeTweetController()
        let tweetSuccess = ctc.validate(text: "aaaaaaaaaaaaaa.")
        XCTAssertTrue(tweetSuccess)
    }
    
    func testValidate_2() throws {
        let ctc = ComposeTweetController()
        let tweetFailure = ctc.validate(text: "Apple Inc. is an American multinational technology company headquartered in Cupertino, California, United States. Apple is the largest technology company by revenue (totaling US$365.8 billion in 2021) and, as of June 2022, is the world's biggest company by market capitalization, the fourth-largest personal computer vendor by unit sales and second-largest mobile phone manufacturer. It is one of the Big Five American information technology companies, alongside Alphabet, Amazon, Meta, and Microsoft.")
        XCTAssertFalse(tweetFailure)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
