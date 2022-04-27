//
//  MassagesView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 25.04.2022.
//

import SwiftUI

struct MassagesView: View {
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            Color("Blue")
                .opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Title2View()
                
                Text("Massages")
                    .font(.system(size: height / 30))
                
                ScrollView {
                    DialogView()
                    DialogView()
                    DialogView()
                    DialogView()
                }
                
                Spacer()
            }
        }
    }
}

struct MassagesView_Previews: PreviewProvider {
    static var previews: some View {
        MassagesView()
    }
}


struct DialogView: View {
    let height = UIScreen.main.bounds.height
    let width = UIScreen.main.bounds.width
    @State private var isShowChat = false
    var body: some View {
        VStack {
            HStack {
                AvaView(imageName: "Ava2")
                VStack(alignment: .leading) {
                    Text("Juls Moore")
                        .font(.system(size: height / 50))
                    Text("I saw her without her iconic red lips and full teased hair, a true rockstar through and through.")
                        .font(.system(size: height / 60))
                }
                .padding()
               
            }.padding(.horizontal)
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: width - 40, height: 5)
                .foregroundColor(.white)
        }
        .onTapGesture {
            isShowChat.toggle()
        }
        .fullScreenCover(isPresented:  $isShowChat) {
            ChatView()
        }
        
    }
}
