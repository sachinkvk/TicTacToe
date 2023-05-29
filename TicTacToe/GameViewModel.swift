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
        turn = turn == .cross ? .nought : .cross
    }

}
