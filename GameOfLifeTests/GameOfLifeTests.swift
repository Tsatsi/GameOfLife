//
//  GameOfLifeTests.swift
//  GameOfLifeTests
//
//  Created by Tsatsi Mahase on 2019/10/05.
//  Copyright © 2019 wisebudget. All rights reserved.
//

import XCTest
@testable import GameOfLife

class GameOfLifeTests: XCTestCase {
    
    func test_tick_emptyGrid_doesNothing() {
        XCTAssertEqual(tick([]), [])
        XCTAssertTrue(tick([[]]) == [[]])
    }
    
    func test_tick_allCellDead_doesNothing() {
        let deadCellsState = [[makeDeadCell(), makeDeadCell(), makeDeadCell()],
                         [makeDeadCell(), makeDeadCell(), makeDeadCell()],
                         [makeDeadCell(), makeDeadCell(), makeDeadCell()]]
        XCTAssertEqual(tick(deadCellsState), deadCellsState)
    }
    
    func test_live_cell_with_fewer_than_2_alive_neighbors_dies(){

        XCTAssertTrue(tick([[makeDeadCell(), makeDeadCell(), makeDeadCell()],
                            [makeDeadCell(), makeLiveCell(), makeDeadCell()],
                            [makeDeadCell(), makeDeadCell(), makeDeadCell()]])
                            ==
                            [[makeDeadCell(), makeDeadCell(), makeDeadCell()],
                             [makeDeadCell(), makeDeadCell(), makeDeadCell()],
                             [makeDeadCell(), makeDeadCell(), makeDeadCell()]])
        
        XCTAssertTrue(tick([[makeLiveCell(), makeDeadCell(), makeDeadCell()],
                            [makeDeadCell(), makeLiveCell(), makeDeadCell()],
                            [makeDeadCell(), makeDeadCell(), makeDeadCell()]])
            ==
            [[makeDeadCell(), makeDeadCell(), makeDeadCell()],
             [makeDeadCell(), makeDeadCell(), makeDeadCell()],
             [makeDeadCell(), makeDeadCell(), makeDeadCell()]])
    }
    
    func test_live_cell_with_more_than_3_live_neighbors_dies(){

        XCTAssertTrue(tick([[makeLiveCell(), makeDeadCell(), makeLiveCell()],
                            [makeDeadCell(), makeLiveCell(), makeDeadCell()],
                            [makeLiveCell(), makeDeadCell(), makeLiveCell()]])
                            ==
                        [[makeDeadCell(), makeLiveCell(), makeDeadCell()],
                         [makeLiveCell(), makeDeadCell(), makeLiveCell()],
                         [makeDeadCell(), makeLiveCell(), makeDeadCell()]])
    }
    
    func test_live_cell_with_2_neighbors_lives_on() {
        XCTAssertTrue(tick([[makeLiveCell(), makeDeadCell(), makeDeadCell()],
                            [makeDeadCell(), makeLiveCell(), makeDeadCell()],
                            [makeDeadCell(), makeDeadCell(), makeLiveCell()]])
                            ==
                            [[makeDeadCell(), makeDeadCell(), makeDeadCell()],
                             [makeDeadCell(), makeLiveCell(), makeDeadCell()],
                             [makeDeadCell(), makeDeadCell(), makeDeadCell()]])
    }
    
    func test_live_cell_with_3_neighbors_lives_on() {
        XCTAssertTrue(tick([[makeLiveCell(), makeDeadCell(), makeLiveCell()],
                            [makeDeadCell(), makeLiveCell(), makeDeadCell()],
                            [makeDeadCell(), makeDeadCell(), makeLiveCell()]])
            ==
            [[makeDeadCell(), makeLiveCell(), makeDeadCell()],
             [makeDeadCell(), makeLiveCell(), makeLiveCell()],
             [makeDeadCell(), makeDeadCell(), makeDeadCell()]])
    }
    
    func test_dead_cell_with_3_live_neighbors_becomes_alive(){
        XCTAssertTrue(tick([[makeLiveCell(), makeDeadCell(), makeLiveCell()],
                            [makeDeadCell(), makeDeadCell(), makeDeadCell()],
                            [makeLiveCell(), makeDeadCell(), makeDeadCell()]])
                            ==
                          [[makeDeadCell(), makeDeadCell(), makeDeadCell()],
                          [makeDeadCell(), makeLiveCell(), makeDeadCell()],
                          [makeDeadCell(), makeDeadCell(), makeDeadCell()]])
        
        XCTAssertTrue(tick([[makeLiveCell(), makeDeadCell(), makeLiveCell()],
                            [makeDeadCell(), makeDeadCell(), makeDeadCell()],
                            [makeDeadCell(), makeDeadCell(), makeLiveCell()]])
                            ==
                          [[makeDeadCell(), makeDeadCell(), makeDeadCell()],
                           [makeDeadCell(), makeLiveCell(), makeDeadCell()],
                           [makeDeadCell(), makeDeadCell(), makeDeadCell()]])
        
    }
}

private func == <T: Equatable>(lhs: [[T]], rhs: [[T]]) -> Bool {
    guard lhs.count == rhs.count else { return false }
    for (i, left) in lhs.enumerated() {
        if rhs[i] != left { return false }
    }
    return true
}
