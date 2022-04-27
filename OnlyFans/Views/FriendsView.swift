//
//  FriendsView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 19.04.2022.
//

import SwiftUI

struct FriendsView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            Color("Blue").opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Title2View().padding(.top, height / 10)
                HStack {
                    Text("Friends: 362")
                        .font(.system(size: height / 25))
                    Spacer()
                }.padding(.horizontal, 30)
                
                ScrollView {
                    ForEach(0..<20) { _ in
                        HStack {
                            FriendCard()
                            FriendCard()
                        }
                    }
                }.frame(width: .infinity, height: .infinity)
            }.ignoresSafeArea()
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}

struct FriendCard: View {
    @State private var showingOptions = false
    @State private var isShowProfile = false
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        
            RoundedRectangle(cornerRadius: 10)
                .frame(width: width / 2.2, height: height / 4.2)
                .foregroundColor(.white)
            .shadow(color: .black.opacity(0.3), radius: 5, x: 3, y: 5)
            
            .overlay(
            
                VStack {
                    AvaView(imageName: "Ava2")
                        .frame(width: width / 3, height: height / 10)
                        .onTapGesture {
                            isShowProfile.toggle()
                        }
                    Text("Renata")
                    
                    HStack {
                        Button(action: {}) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: width / 6, height: height / 35)
                                    .foregroundColor(.gray)
                                .opacity(0.5)
                                Text("Delete").foregroundColor(.black)
                                    .font(.system(size: height / 60))
                            }
                        }
                        
                        
                        Button(action: {showingOptions.toggle()}) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: width / 6, height: height / 35)
                                    .foregroundColor(.gray)
                                .opacity(0.5)
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            )
            .fullScreenCover(isPresented: $isShowProfile) {
                GlobalUserProfilwView()
            }
        
            .actionSheet(isPresented: $showingOptions, content: {
                ActionSheet(title: Text("Report user profil"),
                            buttons: [
                                .default(Text("Report spam")) {
                                    
                                },
                                .default(Text("Report fake profile")) {
                                    
                                },
                                
                                    .default(Text("Report fake profile")) {
                                        
                                    },
                                
                                    .destructive(Text("Block user")) {
                                        
                                    },
                                
                                    .cancel()
                            ])
            })
        
    }
}
