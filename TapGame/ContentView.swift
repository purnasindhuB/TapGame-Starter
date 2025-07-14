//
//  ContentView.swift
//  TapGame
//
//

import SwiftUI

struct ContentView: View {
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //combine pulisher : -
    /* Triggers every sec
     -> runs on main run loop so ui updation is safe
     -> Adds it to the common run loop mode, which keeps it responsive during scrolling or gestures
     -> doesn't start automatically — it needs to be connected using .autoconnect().
     */
    @State private var currentPicIndex = 0
    @State private var targetIndex = 0
    @State private var score = 0
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    @State private var showAlert = false
    @State private var difficulty : Difficulty = .easy
    @State private var isRunning = true
    
    var possiblePics = ["apple","dog","egg"]
    var randomTarget: Int {
        return Int.random(in: 0..<possiblePics.count)
    }
    
    enum Difficulty : Double {
        case easy = 1, medium = 0.5, hard = 0.1
        
        
        var title: String {
            switch self{
            case .easy :
                return "Easy"
            case .medium :
                return "Medium"
            case .hard :
                return "Hard"
            }
        }
    }
    var body: some View {
        VStack {
            HStack{
                Menu("Difficulty") {
                    Button(Difficulty.easy.title) {
                        difficulty = .easy
                    }
                    Button(Difficulty.medium.title) {
                        difficulty = .medium
                    }
                    Button(Difficulty.hard.title) {
                        difficulty = .hard
                    }
                }
                .opacity(isRunning ? 0 : 1)
                .disabled(isRunning)
                
                Spacer()
                Text("Score is \(score)")
            }
            .padding(.horizontal)
            Image(possiblePics[currentPicIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
                .onTapGesture {
                    timer.upstream.connect().cancel()
                    isRunning = false
                    if currentPicIndex == targetIndex {
                        score += 1
                        alertTitle = "Success"
                        alertMessage = "You got correct answer!"
                    }
                    else {
                        alertTitle = "Incorrect"
                        alertMessage = "You got wrong answer"
                    }
                    showAlert = true
                }
            Text(possiblePics[targetIndex])
                .font(.headline)
                .padding(.top)
            
            if !isRunning{
                Button("Restart Game") {
                    isRunning = true
                    targetIndex = randomTarget
                    timer = Timer.publish(every: difficulty.rawValue, on: .main, in: .common).autoconnect()    
                }.padding(.top)
            }
        }
        //SwiftUI to listen to the timer’s published values and run a block of code every time the timer emits.
        .onReceive(timer, perform: { _ in
            changePics()
        })
        .alert(alertTitle, isPresented: $showAlert){
            Button("ok",action: {
                
            })
        } message: {
            Text(alertMessage)
        }
    }
    
    func changePics() {
        if currentPicIndex == possiblePics.count - 1 {
            currentPicIndex = 0
        }
        else {
            currentPicIndex += 1
        }
    }
}

#Preview {
    ContentView()
}
