//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Куаныш Спандияр on 09.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "USA", "Monaco"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var previousScore = 0
    @State private var count = 1
    @State private var answer = ""
    
    
    var body: some View {
        ZStack {
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.6, green: 0.55, blue: 0.95), location: 0.3),
                .init(color: Color(red: 0.46, green: 0.15, blue: 0.56), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
                
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            count+=1
                            
                        } label: {
                            Image(countries[number])
                                .clipShape(.rect)
                                .shadow(radius: 5)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
            }.padding()
            
        }.alert(scoreTitle, isPresented: $showingScore) {
            if(count >= 8 && scoreTitle == "Try again") {
                Button("Restart", action: askQuestion)
            } else {
                Button("Continue", action: askQuestion)
            }
            
        } message: {
            if(scoreTitle == "Wrong") {
                Text("Wrong! That's the flag of \(answer)!")
            } else if (count >= 8 && scoreTitle == "Try again") {
                Text("Game is over! Your score is \(previousScore)")
            } else {
                Text("Your score is \(score)")
            }
            
        }
        
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            
        } else if(count >= 8) {
            previousScore = score
            scoreTitle = "Try again"
            count = 0
            score = 0
        } else {
            scoreTitle = "Wrong"
            answer = countries[number]
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

}

#Preview {
    ContentView()
}
