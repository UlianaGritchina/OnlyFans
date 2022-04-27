//
//  CommentsView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 25.04.2022.
//

import SwiftUI

struct CommentsView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color("Blue")
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {presentationMode.wrappedValue.dismiss()}, label: {Text("Done")})
                }.padding(.horizontal)
                
                    Text("Comments")
                        .font(.system(size: height / 30))
                    .padding()
                    
               
                
                
                ScrollView {
                    Comment()
                    Comment()
                    Comment()
                    Comment()
                    Comment()
                    Comment()
                }
                
                
                
                Spacer()
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}

struct Comment: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var isLiked = false
    @State private var count = Int.random(in: 1...100)
    var body: some View {
        HStack {
            AvaView(imageName: "Ava3")
            VStack(alignment: .leading) {
                Text("Kate Mills")
                Text("I saw her without her iconic red lips and full teased hair,a true rockstar through and through.")
                    .font(.system(size: height / 60))
                
              
            }
            VStack {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .foregroundColor(isLiked ? .red : .black)
                    .onTapGesture {
                        isLiked.toggle()
                        if isLiked {
                            count += 1
                        } else {
                            count -= 1
                        }
                    }
                Text("\(count)")
            }
        }.padding(.horizontal)
    }
}
