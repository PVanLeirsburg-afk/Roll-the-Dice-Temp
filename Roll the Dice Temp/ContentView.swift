//
//  ContentView.swift
//  Roll the Dice Temp
//
//  Created by Pamela VanLeirsburg on 10/14/26.
//

import SwiftUI

struct ContentView: View {
    @State private var randomValue = 0
    @State private var rotation = 0.0
    var body: some View {

        VStack {
            Text("Dice Roll")
                .font(.title)
            Image("pips \(randomValue)")
                .resizable()
                .frame(width: 200, height: 200)
                .padding()
                .onTapGesture {
                    chooseRandom(times: 3)
                    withAnimation {
                        rotation += 360
                    }
                    
                }
                .rotationEffect(.degrees(rotation))
                .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
                
            
        }
    }
    func chooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValue = Int.random(in: 1...6)
                chooseRandom(times: times - 1)
            }
        }
    }
}

#Preview {
    ContentView()
}
