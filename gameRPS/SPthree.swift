//
//  SPthree.swift
//  gameRPS
//
//  Created by Amir on 18.09.2022.
//

import SwiftUI

struct SPthree: View {
    @ObservedObject var game: GameValues
    @State var switchPage = false
    var body: some View {
        ZStack{
            VStack{
                Texts(myText: "Your opponet's Pick")
                ZStack{
                    Capsule().fill(myColor.capsuleColor).frame(height: 128)
                    
                    Text("\(game.pc)")
                        .font(.system(size:60))
                    
                }
                
            }
            
            
            NavigationLink(isActive: $switchPage) {
                SPfour(game: game)
                    .navigationBarBackButtonHidden(true)
            } label: {
                EmptyView()
            }
            
            
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                switchPage.toggle()
        
            }
        }
        
    }
}

//struct SPthree_Previews: PreviewProvider {
//    static var previews: some View {
//        SPthree()
//    }
//}
