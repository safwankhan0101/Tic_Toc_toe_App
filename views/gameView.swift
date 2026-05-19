//
//  gameView.swift
//  ticTacToeApp
//
//  Created by Apple Orchard on 19/12/2025.
//

import SwiftUI

struct GameView: View {
    @StateObject var vm = GameViewModel()

    let columns = Array(repeating: GridItem(.flexible()), count: 3)

    var body: some View {
        VStack(spacing: 20) {
            Text("Current Player: \(vm.currentPlayer.rawValue)")
                .font(.title2)

            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(0..<9) { index in
                    Button {
                        vm.makeMove(index: index)
                    } label: {
                        Text(vm.board[index])
                            .font(.largeTitle)
                            .frame(width: 80, height: 80)
                            .background(Color.black.opacity(0.2))
                    }
                }
            }

            if let winner = vm.winner {
                Text(winner)
                    .font(.title)
                    .foregroundColor(.green)

                Button("Restart") {
                    vm.resetGame()
                }
            }
        }
        .padding()
    }
}
#Preview {
    GameView()
}
