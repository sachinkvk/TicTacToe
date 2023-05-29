//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Sachin Panigrahi on 29/05/23.
//

import Foundation

enum CellState: String {
    case empty = ""
    case cross = "Cross"
    case nought = "Nought"
}

struct Cell {
    var value: CellState
}

class GameViewModel: ObservableObject {
    @Published var cells = [[Cell]]()
    @Published var turn = CellState.cross
    @Published var isWinnerFound = false
    @Published var moveNumber = 0
    private let totalCells = 9
    @Published var isGameDraw = false

    init() {
        setBoard()
    }

    func setBoard() {
        var newCells = [[Cell]]()
        for _ in 0...2 {
            var row = [Cell]()
            for _ in 0...2 {
                row.append(Cell(value: .empty))
            }
            newCells.append(row)
        }
        cells = newCells
        turn = CellState.cross
        isWinnerFound = false
        isGameDraw = false
        moveNumber = 0
    }

    func getCell(for _row: Int, _col: Int) -> String {
        let cell = cells[_row][_col]

        switch cell.value {
        case .empty:
            return ""
        case .cross:
            return "X"
        case .nought:
            return "O"
        }
    }

    func setCell(state: CellState, row: Int, col: Int) {
        if !cells[row][col].value.rawValue.isEmpty { return }

        cells[row][col].value = turn == .cross ? .cross : (turn == .nought ? .nought : .empty)

        if checkWinningCombination() {
            isWinnerFound = true
            return
        } else {
            turn = turn == .cross ? .nought : .cross
        }
        
        moveNumber += 1
        if moveNumber == totalCells && !isWinnerFound {
            isGameDraw = true
        }
    }

    func checkWinningCombination() -> Bool {

        //vertical
        if (cells[0][0].value == turn) && (cells[1][0].value == turn) && (cells[2][0].value == turn) {
            return true
        }

        if (cells[0][1].value == turn) && (cells[1][1].value == turn) && (cells[2][1].value == turn) {
            return true
        }

        if (cells[0][2].value == turn) && (cells[1][2].value == turn) && (cells[2][2].value == turn) {
            return true
        }

        //horizontal
        if (cells[0][0].value == turn) && (cells[0][1].value == turn) && (cells[0][2].value == turn) {
            return true
        }
        if (cells[1][0].value == turn) && (cells[1][1].value == turn) && (cells[1][2].value == turn) {
            return true
        }
        if (cells[2][0].value == turn) && (cells[2][1].value == turn) && (cells[2][2].value == turn) {
            return true
        }

        // diagonal
        if (cells[0][0].value == turn) && (cells[1][1].value == turn) && (cells[2][2].value == turn) {
            return true
        }
        if (cells[0][2].value == turn) && (cells[1][1].value == turn) && (cells[2][0].value == turn) {
            return true
        }

        return false
    }

}
