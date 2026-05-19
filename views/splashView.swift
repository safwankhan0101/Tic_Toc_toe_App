//
//  splashView.swift
//  ticTacToeApp
//
//  Created by Apple Orchard on 19/12/2025.
//
import SwiftUI

struct SplashView: View {
    @StateObject var vm = SplashViewModel()

    var body: some View {
        if vm.isActive {
            ContentView()
        } else {
            VStack {
                Image(systemName: "gamecontroller.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("Tic Tac Toe")
                    .font(.largeTitle)
                    .bold()
            }
            .onAppear {
                vm.start()
            }
        }
    }
}

#Preview {
    SplashView()
}
