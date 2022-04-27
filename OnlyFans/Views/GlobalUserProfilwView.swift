//
//  GlobalUserProfilwView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 19.04.2022.
//

import SwiftUI

struct GlobalUserProfilwView: View {
    @State private var isShowChat = false
    var body: some View {
        ZStack {
            Color("Blue")
                .opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Title2View()
                
                ProfileinfoView()
                HStack {
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Delete friend")
                            .frame(width: 120, height: 29)
                            .foregroundColor(.black)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(3)
                    }
                    
                    Button(action: {isShowChat.toggle()}) {
                        Text("Massage")
                            .frame(width: 120, height: 29)
                            .foregroundColor(.black)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(3)
                    }
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                       Image(systemName: "ellipsis")
                            .frame(width: 60, height: 29)
                            .foregroundColor(.black)
                            .background(Color.gray.opacity(0.4))
                            .cornerRadius(3)
                    }
                }.padding(.horizontal, 30)
                

                ScrollView {
                    PostView(imageName: "Ava2", name: "Juls Moore", date: "17 dec at 18:01", text: "I saw her without her iconic red lips and full teased hair, a true rockstar through and through.", postImageName: "postimage5")
                    
                    PostView(imageName: "Ava2", name: "Juls Moore", date: "17 dec at 18:01", text: "I saw her without her iconic red lips and full teased hair, a true rockstar through and through.", postImageName: "postImage6")
                }
                
            }
            .fullScreenCover(isPresented: $isShowChat) {
                ChatView()
            }
        }
    }
}

struct GlobalUserProfilwView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalUserProfilwView()
    }
}

struct ProfileinfoView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        HStack {
            AvaView(imageName: "Ava2")
                .overlay(Circle().stroke(Color("Blue"), lineWidth: 2))
            Spacer()
            VStack(alignment: .leading, spacing: height / 65) {
                VStack(alignment: .leading) {
                    Text("Anatoly Berbeka")
                        .font(.system(size: height / 30))
                    Text("musician, blogger, interesting person")
                }
                
                
                HStack(spacing: width / 7) {
                    VStack {
                        Text("Friends")
                        Text("365").font(.system(size: height / 40))
                    }
                   
                    VStack {
                        Text("Posts")
                        Text("365").font(.system(size: height / 40))
                    }
                    
                    VStack {
                        Text("Likes")
                        Text("365").font(.system(size: height / 40))
                    }
                }
            }
        }.padding(.horizontal, width / 15)
        
        
    }
}
