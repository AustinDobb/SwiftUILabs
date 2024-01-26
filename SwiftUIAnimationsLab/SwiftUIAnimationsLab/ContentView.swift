//
//  ContentView.swift
//  SwiftUIAnimationsLab
//
//  Created by Austin Dobberfuhl on 1/25/24.
//

import SwiftUI
//hard chain 3 animations that go after one another like using completion


struct ContentView: View {
    @State private var gameStarted = false
    @State private var countdownNumber = 3
    @State private var showGo = false
    @State private var showCountdown = true
    @State private var goStarted = false
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                if showCountdown {
                    Text("\(countdownNumber)")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .scaleEffect(gameStarted ? 4 : 1)
                        .opacity(gameStarted ? 1 : 0)
                    
                }
                
                if showGo == true {
                    Text("GO!")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .scaleEffect(goStarted ? 1 : 4)
                }
                
                Spacer()
                
                Button(action: {
                    startCountdown()
                    gameStarted.toggle()
                }
                       , label: {
                    Text("Start Game")
                })
            }
            .padding()
        }
    }
    
    
    func startCountdown() {
        var countdownTimer: Timer?
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            withAnimation(.easeOut(duration: 0.9)) {
                gameStarted.toggle()
            } completion: {
                
                countdownNumber -= 1
                guard countdownNumber > 0 else { return }
                
                gameStarted.toggle()
            }
            
            if countdownNumber == 0 {
                timer.invalidate()
                showCountdown = false
                showGo = true
                withAnimation(.easeOut(duration: 0.9)) {
                    goStarted.toggle()
                    
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
//        func countingDown() {
//            while countdownNumber > 1 {
//                countdownNumber -= 1
//            }
//            if countdownNumber == 1 {
//                withAnimation(.smooth().delay(1)) {
//                    showGo.toggle()
//                }
//            }
//        }
