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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testBoardSetup() {
        XCTAssertNotNil(gameViewModel)
        gameViewModel.setBoard()

        XCTAssertEqual(gameViewModel.cells.count, 3) // total rows
        XCTAssertEqual(gameViewModel.cells[0].count , 3) // first row
        XCTAssertEqual(gameViewModel.cells[1].count , 3) // second row
        XCTAssertEqual(gameViewModel.cells[2].count , 3) // third row
    }

    func testPlayersMove() {

        gameViewModel.setBoard()

        XCTAssertEqual(gameViewModel.turn, .cross)

        gameViewModel.setCell(state: .cross, row: 1, col: 0)
        XCTAssertEqual(gameViewModel.getCell(for: 1, _col: 0), "X")

        XCTAssertEqual(gameViewModel.turn, .nought)

        gameViewModel.setCell(state: .nought, row: 1, col: 1)
        XCTAssertEqual(gameViewModel.getCell(for: 1, _col: 1), "O")

        XCTAssertEqual(gameViewModel.turn, .cross)

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
