//
//  ContentView.swift
//  WordsGame
//
//  Created by MacBook on 05.06.2022.
//

import SwiftUI

struct StartView: View {
    
    @State var bigWord = ""
    @State var player1 = ""
    @State var player2 = ""
    
    @State var isShowedGame = false
    @State var isAlertPresented = false
    var body: some View {
        
        VStack{
            
            TitleText(text: "WordsGame")
            
            WordsTextField(word: $bigWord, placeholder: "Введите длинное слово")
                .padding(20)
                .padding(.top, 32)
            
            WordsTextField(word: $player1, placeholder: "Игрок 1")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            WordsTextField(word: $player2, placeholder: "Игрок 2")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            Button {
                
                if bigWord.count > 7 {
                    isShowedGame.toggle()
                } else {
                
                    self.isAlertPresented.toggle()
                }
            } label: {
                Text("Старт")
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 64)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(100)
                    .padding(.top)
            }
            
            
        }.background(Image("background"))
                .alert("Придумайте слово длиннее семи букв!",
                       isPresented: $isAlertPresented,
                       actions: {
                    Text("OK!")
                })
            .fullScreenCover(isPresented: $isShowedGame) {
                
                let name1 = player1 == "" ? "Игрок 1" : player1
                let name2 = player2 == "" ? "Игрок 2" : player2
                
                let player1 = Player(name: name1)
                let player2 = Player(name: name2)
                
                let gameViewModel = GameViewModel(player1: player1,
                                                  player2: player2,
                                                  word: bigWord)
                
                GameView(viewModel: gameViewModel)
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
