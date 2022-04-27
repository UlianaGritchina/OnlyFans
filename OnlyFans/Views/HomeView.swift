//
//  HomeView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 18.04.2022.
//

import SwiftUI

struct HomeView: View {
    @State private var selected = "News"
    @State private var isShowProfil = false
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            Color("Blue")
                .opacity(0.3)
                .ignoresSafeArea()
            VStack {
                TitleView(isShowProfil: $isShowProfil)
                PickerView(selected: $selected)
                
                ScrollView {
                    if selected == "News" {
                        PostView(imageName: "Ava2",  name: "Kate Mills", date: "17 dec at 18:01", text: "I saw her without her iconic red lips and full teased hair, a true rockstar through and through.", postImageName: "postImage")
                            .padding()
                        PostView(imageName: "Ava3", name: "Kate Mills", date: "17 dec at 18:01", text: "I saw her without her iconic red lips and full teased hair, a true rockstar through and through.", postImageName: "PostImage2")
                            .padding()
                    } else {
                        PostView(imageName: "Ava3", name: "Kate Mills", date: "17 dec at 18:01", text: "I saw her without her iconic red lips and full teased hair, a true rockstar through and through.", postImageName: "PostImage2")
                            .padding()
                        PostView(imageName: "Ava2",  name: "Kate Mills", date: "17 dec at 18:01", text: "I saw her without her iconic red lips and full teased hair, a true rockstar through and through.", postImageName: "postImage")
                            .padding()
                    }
                    
                }
            }
        }
        .fullScreenCover(isPresented: $isShowProfil) {
            ProfilView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TitleView: View {
    @Binding var isShowProfil: Bool
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        HStack(spacing: width / 10) {
            AvaView(imageName: "Ava")
                .onTapGesture {
                    isShowProfil.toggle()
                }
            Image("Logo-2")
                .resizable()
                .frame(width: width / 2, height: height / 13)
            
            Spacer()
        }.padding(.horizontal, 30)
    }
}

struct PickerView: View {
    @Binding var selected: String
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        Picker(selection: $selected, label: Text("Picker")) {
            Text("News").tag("News")
            Text("Recomedations").tag("Recomedations")
        }
        .pickerStyle(SegmentedPickerStyle())
        .colorMultiply(Color("Blue"))
        .frame(width: width - 80)
    }
}

struct AvaView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: width / 5, height: height / 6)
            .clipShape(Circle())
    }
}


struct PostView: View {
    @State private var showingOptions = false
    @State private var showProfile = false
    @State private var showChat = false
    @State private var isLiked = false
    @State private var count = 8987
    let imageName: String
    let name: String
    let date: String
    let text: String
    let postImageName: String
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                AvaView(imageName: imageName).padding(.leading)
                    .onTapGesture {
                        showProfile.toggle()
                    }
                VStack(alignment: .leading) {
                    HStack {
                        
                        Text(name)
                            .font(.system(size: height / 45))
                        Text("17 dec at 18:01")
                            .font(.system(size: height / 80))
                        Spacer()
                        Image(systemName: "ellipsis")
                            .onTapGesture {
                                showingOptions.toggle()
                            }
                    }
                    
                    Text(text)
                        .font(.system(size: height / 55))
                    
                    
                    
                }.padding(.horizontal)
            }
            Image(postImageName)
                .resizable()
                .frame(width: width, height: height / 3)
            
            HStack {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .foregroundColor(isLiked ? .red : .black)
                    .onTapGesture {
                        isLiked.toggle()
                        count += 1
                    }
                Image(systemName: "message")
                    .onTapGesture {
                        showChat.toggle()
                    }
                Text("Liked by \(count) users")
                Spacer()
            }.padding()
        }
        .fullScreenCover(isPresented: $showProfile, content: {
            GlobalUserProfilwView()
        })
        .fullScreenCover(isPresented: $showChat, content: {
            CommentsView()
        })
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

