//
//  KingsCupTests.swift
//  KingsCupTests
//
//  Created by Tony Li on 12/30/21.
//

import XCTest

@testable import KingsCup

class KingsCupTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFlip() throws {
        let vm = KingsCupViewModel(num_players: 1)
        
        XCTAssertNotNil(vm.curr_card)
        XCTAssertFalse(vm.curr_card!.isFacingUp)
        
        vm.flip()
        
        XCTAssertTrue(vm.curr_card!.isFacingUp)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
