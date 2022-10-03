//
//  MenuPage.swift
//  gameRPS
//
//  Created by Amir on 17.09.2022.
//

import SwiftUI




struct MenuPage: View {
    @State var roundNumber: Int = 0
//    @StateObject var game = GameValues()
    @State var singlePlayer: Bool = false
    var body: some View {
        NavigationView {
            ZStack{
                backgroundWallpaper
                VStack(spacing: 10) {
                    Text("Welcome to the game!")
                        .foregroundColor(.white)
                        .font(.system(size:54))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    

                    
                    NavigationLink(isActive: $singlePlayer) {
                        SPone()
                    } label: {
                        buttonUI(textOnButton: "Single player")
                    }
                    
                    NavigationLink(isActive: $singlePlayer) {
                        SPone()
                    } label: {
                        buttonUI(textOnButton: "Multi player")
                    }
                    
                    
                }
                .padding()
            }
        }
    }
    
    var backgroundWallpaper: some View {
        ZStack{
            Image("rpsBG")
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    
}


struct singlePlayerButton: View {
  //  @Binding var playSingle: Bool
    var body: some View {
        Button {
           // playSingle = true
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8).fill(myColor.purpleMy).frame(height: 50)
                Text("Single Player")
                    .foregroundColor(.white)
                    .font(.system(size:16))
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }
}


struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage()
    }
}
