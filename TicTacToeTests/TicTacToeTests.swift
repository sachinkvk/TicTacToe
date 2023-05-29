//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Sachin Panigrahi on 28/05/23.
//

import XCTest
@testable import TicTacToe

final class TicTacToeTests: XCTestCase {
    var gameViewModel = GameViewModel()

    func testBoardSetup() {
        XCTAssertNotNil(gameViewModel)
        gameViewModel.setBoard()

        XCTAssertEqual(gameViewModel.cells.count, 3) // total rows
        XCTAssertEqual(gameViewModel.cells[0].count , 3) // first row
        XCTAssertEqual(gameViewModel.cells[1].count , 3) // second row
        XCTAssertEqual(gameViewModel.cells[2].count , 3) // third row
    }

    override func setUpWithError() throws {
        gameViewModel = GameViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
