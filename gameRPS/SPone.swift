//
//  SPone.swift
//  gameRPS
//
//  Created by Amir on 17.09.2022.
//
import SwiftUI

class GameValues: ObservableObject {
    @Published var score = 0
    @Published var mychoice = ""
    @Published var pc = ""
    
    func pcChoice() -> String{
        
        let randomint: Int = Int.random(in: 1...3)
        
        if randomint == 1{
            return "🪨"
        
        }
        if randomint == 2{
            return "📜"
        }
        else {
            return "✂️"
        }
    }
    
    
    func battle(mychoice: String, person2choice: String) -> Int{
        if mychoice == person2choice{
            return 1
        }
        else if ((mychoice == "🪨" && person2choice == "✂️") || (mychoice == "✂️" && person2choice == "📜") || (mychoice == "📜" && person2choice == "🪨")){
            return 2 // i win
        }
        
        else {
            return 3  //i loose
        }
        
    }
    

}



struct SPone: View {
    
    @State var switchPage = false
    @StateObject var game = GameValues()
    @State var roundcount = 1
    var body: some View {
        ZStack{
            Color.white
            VStack{
                Text("Take your pick")
                    .font(.custom("SF-Pro-Display", size: 54)
                            .weight(.bold))
                
                        Button{
                            game.mychoice = "🪨"
                            switchPage = true
                            game.pc = game.pcChoice()
                        } label: {
                            ZStack {
                                Capsule().fill(myColor.capsuleColor).frame(height: 128)
                                Text("🪨")
                                    .font(.system(size:60))
                                    .fontWeight(.semibold)
                            }
                            .padding()
                        }
                
                Button {
                  
                    game.mychoice = "📜"
                     switchPage = true
                    game.pc = game.pcChoice()
                } label: {
                    ZStack {
                        Capsule().fill(myColor.capsuleColor).frame(height: 128)
                        Text("📜")
                            .font(.system(size:60))
                            .fontWeight(.semibold)
                    }
                    .padding()
                }
                
                Button {
                   
                     switchPage = true
                    game.mychoice = "✂️"
                    game.pc = game.pcChoice()
                } label: {
                    ZStack {
                        Capsule().fill(myColor.capsuleColor).frame(height: 128)
                        Text("✂️")
                            .font(.system(size:60))
                            .fontWeight(.semibold)
                    }
                    .padding()
                }
            }
            
            NavigationLink(isActive: $switchPage) {
                SPtwo(game: game)
            } label: {
                EmptyView()
            }
            
            //     .navigationBarTitle(Text("Example"))
            //.navigationBarTitle("Round : \(game.score)", displayMode: .inline)
            
        }
    }
}

struct SPone_Previews: PreviewProvider {
    static var previews: some View {
        SPone()
    }
}


enum myColor{
    static let purpleMy = Color(red: 0.4 , green:  0.31, blue: 0.64)
    static let capsuleColor = Color(red: 0.95 , green:  0.95, blue: 0.97)
    static let yellow_On = Color(red: 1 , green:  0.8, blue: 0)
    static let yello_Off = Color(red: 1 , green:  0.878, blue: 0.4).opacity(0.3)
    
    static let lightBlueColor = Color(red: 212/255, green: 225/255, blue: 248/255)
    
    static let orangeOne = Color(red: 255/255, green: 204/255, blue: 0/255)
    
    static let orangeTwo = Color(red: 255/255, green: 92/255, blue: 0/255)
    
    static let redOne = Color(red: 255/255, green: 105/255, blue: 97/255)
    
    static let redTwo = Color(red: 253/255, green: 77/255, blue: 77/255)
    
    static let greenOne = Color(red: 181/255, green: 238/255, blue: 155/255)
    
    static let greenTwo = Color(red: 36/255, green: 174/255, blue: 67/255)


}





