//
//  GameOfLifeTests.swift
//  GameOfLife
//
//  Created by Tsatsi Mahase on 2019/10/05.
//  Copyright © 2019 wisebudget. All rights reserved.
//

import Foundation

typealias Cell = Bool
typealias GameState = [[Cell]]

func makeLiveCell() -> Cell{
    return true
}
func makeDeadCell() -> Cell{
    return false
}
func tick(_ state: GameState) -> GameState {
    return state.enumerated().map { (column, rows) in
        return rows.enumerated().map { (row, cell) in
            let aliveNeighbors = aliveNeighborsCount(forColumn: column, row: row, in: state)
            if aliveNeighbors == 3 {
                return makeLiveCell()
            }
            if cell == makeLiveCell(), aliveNeighbors == 2 {
                return cell
            }

            return makeDeadCell()
        }
    }
}

private func aliveNeighborsCount(forColumn column: Int, row: Int, in game: GameState) -> Int {
    return (-1...1).reduce(0, { (acc, columnOffset) in
        return (-1...1).reduce(0, { (acc, rowOffset) in
            if columnOffset == 0 && rowOffset == 0 { return acc}
            if cell(atColumn: column + columnOffset, row: row + rowOffset, in: game) == makeLiveCell() {
                return acc + 1
            }
            return acc
        }) + acc
    })
}

private func cell(atColumn column: Int, row: Int, in game: GameState) -> Cell? {
    guard column >= 0 && row >= 0 else { return nil }
    guard let rows = game.first?.count, rows > 0 else { return nil }
    guard column < game.count && row < rows else { return nil }
    
    return game[column][row]
}
