//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Sachin Panigrahi on 29/05/23.
//

import Foundation

enum CellState {
    case empty
    case cross
    case nought
}

struct Cell {
    var value: CellState
}

class GameViewModel {
    var cells = [[Cell]]()

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
}
