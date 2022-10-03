//
//  SPtwo.swift
//  gameRPS
//
//  Created by Amir on 17.09.2022.
//

import SwiftUI

struct SPtwo: View {
    @State var confirmPick = false
    @State var switchPage = false
    @ObservedObject var game: GameValues
    var body: some View {
        ZStack{
            Color.white
            VStack{
                if !confirmPick{
                    VStack{
                        Texts(myText: "Your Pick")
                        
                        Button {
                            confirmPick.toggle()
                            
                        } label: {
                            buttonRPS(emoji: "\(game.mychoice)")
                                .frame(height: 128)
                        }
                        
                    }
                }
                
                
                else{
                    VStack{
                        Texts(myText: "Your opponent is thinking")
                        
                        ZStack{
                            Capsule().fill(myColor.capsuleColor).frame(height: 128)
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                                .scaleEffect(3)
                        }
                        
                        
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            switchPage.toggle()
                        }
                    }
                }
                NavigationLink(isActive: $switchPage) {
                    SPthree(game: game)
                        .navigationBarBackButtonHidden(true)
                    } label: {
                      EmptyView()
                       }
            }
        }
    }
}

////PREVIEW

//struct SPtwo_Previews: PreviewProvider {
//    static var previews: some View {
//        SPtwo()
//    }
//}



struct Texts: View {
    var myText: String
    var body: some View {
        ZStack{
            Text(myText)
                .font(.custom("SF-Pro-Display", size: 54)
                        .weight(.semibold))
        }
    }
}

struct buttonRPS: View {
    var emoji: String
  //  @Binding var playSingle: Bool
    var body: some View {
            ZStack {
                Capsule().fill(myColor.capsuleColor).frame(height: 128)
                Text(emoji)
                    .font(.system(size:80))
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }


struct buttonUI: View {
    var textOnButton: String
  //  @Binding var playSingle: Bool
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 8).fill(myColor.purpleMy).frame(height: 50)
                Text(textOnButton)
                    .foregroundColor(.white)
                    .font(.system(size:16))
                    .fontWeight(.semibold)
            }
            .padding()
    }
}
