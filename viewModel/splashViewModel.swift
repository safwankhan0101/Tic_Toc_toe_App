//
//  splashViewModel.swift
//  ticTacToeApp
//
//  Created by Apple Orchard on 19/12/2025.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var isActive = false

    func start() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isActive = true
        }
    }
}
