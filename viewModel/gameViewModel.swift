//
//  gameViewModel.swift
//  ticTacToeApp
//
//  Created by Apple Orchard on 19/12/2025.
//
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var board = Array(repeating: "", count: 9)
    @Published var currentPlayer: Player = .x
    @Published var winner: String?

    func makeMove(index: Int) {
        guard board[index] == "", winner == nil else { return }

        board[index] = currentPlayer.rawValue
        checkWinner()

        currentPlayer = currentPlayer == .x ? .o : .x
    }

    func checkWinner() {
        let wins = [
            [0,1,2],[3,4,5],[6,7,8],
            [0,3,6],[1,4,7],[2,5,8],
            [0,4,8],[2,4,6]
        ]

        for pattern in wins {
            let values = pattern.map { board[$0] }
            if values.allSatisfy({ $0 == "X" }) {
                winner = "Player X Wins!"
                    
            }
            if values.allSatisfy({ $0 == "O" }) {
                winner = "Player O Wins!"
            }
        }
    }

    func resetGame() {
        board = Array(repeating: "", count: 9)
        currentPlayer = .x
        winner = nil
    }
}
