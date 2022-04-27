//
//  ChatView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 25.04.2022.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack {
            Color("Blue").opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
               Top()
                
                Rectangle()
                    .frame(width: .infinity, height: 10)
                    .foregroundColor(.white)
                
                ScrollView {
                    MassageView(side: .right, text: "hello, how are you, I really missed you, let's go for a walk, I met such a cool guy")
                    MassageView(side: .left, text: "hi wow what a guy")
                    
                    MassageView(side: .right, text: "yes there, one developer")
                    
                    MassageView(side: .left, text: "you as usual")
                    
                    MassageView(side: .left, text: "Okay, tell me when we meet.")
                    
                    MassageView(side: .right, text: "When is the best time for you to meet?")
                }
                
               
                
                
                
                
               Spacer()
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}


struct Top: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .overlay(
                    Image(systemName: "chevron.down")
                )
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            Spacer()
            
            ZStack {
                AvaView(imageName: "Ava3")
                Circle()
                    .stroke(.blue)
                    .frame(width: 90, height: 90)
                
            }
            VStack(alignment: .leading) {
                Text("Juls More")
                Text("Active \(Int.random(in: 1...24)) hours ago")
                    .font(.system(size: 13))
            }
            Spacer()
            
        }.padding(.horizontal)
    }
}

struct MassageRect: View {
    let text: String
    var body: some View {
       Text(text)
            .padding()
            //.frame(width: 250)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
            .padding()
    }
}

enum Side {
    case left
    case right
}
struct MassageView: View {
    let side: Side
    let text: String
    var body: some View {
        if side == .left {
            HStack {
                HStack {
                    AvaView(imageName: "Ava3")
                        .frame(width: 90, height: 70)
                    MassageRect(text: text)
                }
                Spacer()
            }
        } else {
            HStack {
                Spacer()
                MassageRect(text: text)
            }
        }
       
    }
}
