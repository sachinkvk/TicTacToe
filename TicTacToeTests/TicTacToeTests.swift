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

        XCTAssertEqual(gameViewModel.getCell(for: 1, _col: 0), "")

        gameViewModel.setCell(state: .cross, row: 1, col: 0)
        XCTAssertEqual(gameViewModel.getCell(for: 1, _col: 0), "X")

        XCTAssertEqual(gameViewModel.turn, .nought)

        gameViewModel.setCell(state: .nought, row: 1, col: 1)
        XCTAssertEqual(gameViewModel.getCell(for: 1, _col: 1), "O")

        XCTAssertEqual(gameViewModel.turn, .cross)

    }

    func testCrossWinningCombination() {
        gameViewModel.setBoard()

        gameViewModel.cells[0][0].value = .cross
        gameViewModel.cells[0][1].value = .cross
        gameViewModel.cells[0][2].value = .cross
        XCTAssertTrue(gameViewModel.checkWinningCombination())

        gameViewModel.cells[0][0].value = .nought
        gameViewModel.cells[0][1].value = .cross
        gameViewModel.cells[0][2].value = .nought
        XCTAssertFalse(gameViewModel.checkWinningCombination())

        gameViewModel.cells[1][0].value = .cross
        gameViewModel.cells[1][1].value = .cross
        gameViewModel.cells[1][2].value = .cross
        XCTAssertTrue(gameViewModel.checkWinningCombination())

        gameViewModel.cells[2][0].value = .cross
        gameViewModel.cells[2][1].value = .cross
        gameViewModel.cells[2][2].value = .cross
        XCTAssertTrue(gameViewModel.checkWinningCombination())
    }

    func testNoughtWinningCombination() {
        gameViewModel.setBoard()
        gameViewModel.turn = .nought
        gameViewModel.cells[0][0].value = .nought
        gameViewModel.cells[0][1].value = .nought
        gameViewModel.cells[0][2].value = .nought
        XCTAssertTrue(gameViewModel.checkWinningCombination())

        gameViewModel.cells[1][0].value = .nought
        gameViewModel.cells[1][1].value = .nought
        gameViewModel.cells[1][2].value = .nought
        XCTAssertTrue(gameViewModel.checkWinningCombination())

        gameViewModel.turn = .nought
        gameViewModel.cells[2][0].value = .nought
        gameViewModel.cells[2][1].value = .nought
        gameViewModel.cells[2][2].value = .nought
        XCTAssertTrue(gameViewModel.checkWinningCombination())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
