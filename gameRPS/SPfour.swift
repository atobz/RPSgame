//
//  SPfour.swift
//  gameRPS
//
//  Created by Amir on 18.09.2022.
//

import SwiftUI

struct SPfour: View {
    @State var buttonAppear = false
    @State var newRound = false
    @ObservedObject var game: GameValues
    var body: some View {
        ZStack{
            VStack{
                if buttonAppear{
                    Winloosetie(intOutcome: game.battle(mychoice: game.mychoice, person2choice: game.pc))
                    
                    SmallButtonRPS(emoji: game.mychoice)
                        .offset(x:-50, y: 0)
                        .transition(.move(edge: .trailing))
                    
                    SmallButtonRPS(emoji: game.pc)
                        .offset(x: 60, y: -75)
                        .transition(.move(edge: .leading))
                    
                }
                
                
                Spacer()
                
                Button {
                    newRound.toggle()
                    game.score = game.score + 1
                } label: {
                    buttonUI(textOnButton: "New round")
                    }
                
                NavigationLink(isActive: $newRound) {
                    SPone()
                } label: {
                    EmptyView()
                }
                
                
                
            }
            .animation(Animation.easeInOut(duration: 2.0))
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                buttonAppear.toggle()
            }
        }
    }
}



struct SmallButtonRPS: View {
    var emoji: String
  //  @Binding var playSingle: Bool
    var body: some View {
            ZStack {
                Capsule().fill(myColor.capsuleColor)
                    .frame(width: 198, height: 128 )
                Text(emoji)
                    .font(.system(size:80))
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }



struct Winloosetie: View{
    
    
   // var text: String
    var intOutcome: Int
    var body: some View{
        if intOutcome == 1{
            ZStack{
                Text("Tie!")
                    .foregroundStyle(
                        .linearGradient(
                            colors: [myColor.orangeOne, myColor.orangeTwo],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .font(.custom("SF-Pro-Display", size: 54)
                            .weight(.bold))
            }
        }
        
        
        
        
        else if intOutcome == 3{
            ZStack{
                Text("Loose")
                    .foregroundStyle(
                        .linearGradient(
                            colors: [myColor.redOne, myColor.redTwo],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .font(.custom("SF-Pro-Display", size: 54)
                            .weight(.bold))
            }
        }
        
        else {  //intOutcome == 2{
            ZStack{
                Text("Win!")
                    .foregroundStyle(
                        .linearGradient(
                            colors: [myColor.greenOne, myColor.greenTwo],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .font(.custom("SF-Pro-Display", size: 54)
                            .weight(.bold))
            }
        }
        
        
        
    }
}
