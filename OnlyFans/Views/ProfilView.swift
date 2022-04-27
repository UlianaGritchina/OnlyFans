//
//  ProfilView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 18.04.2022.
//

import SwiftUI

struct ProfilView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            Color("Blue").opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Title2View()
                ProfilInfo()
             
                ScrollView {
                    PostProfilView(imageName: "Ava", name: "Renata Wollens", date: "17 dec at 18:01", text: "I saw her without her iconic red lips and full teased hair, a true rockstar through and through.", postImageName: "postImage3")
                        .padding()
                    
                    PostProfilView(imageName: "Ava", name: "Renata Wollens", date: "17 dec at 18:01", text: "I saw her without her iconic red lips and full teased hair, a true rockstar through and through.", postImageName: "postImage4")
                        .padding()
                }
                Spacer()
            }
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}

struct Title2View: View {
    @Environment(\.presentationMode) var presentationMode
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        HStack(spacing: width / 6) {
            ZStack() {
                Circle()
                    .frame(width: width / 13, height:  width / 13)
                    .foregroundColor(.white)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Image(systemName: "chevron.down")
                    .font(.system(size: height / 35))
            }
            
            Image("Logo-2")
                .resizable()
                .frame(width: width / 2, height: height / 15)
            
            Spacer()
            
        }
        .padding(.horizontal, 30)
    }
}

struct Rect: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let title: String
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: width / 6 , height: height / 13)
            .foregroundColor(.white)
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
            .overlay(VStack {
                Text(title)
                Text("365")
            })
    }
}

struct ProfilInfo: View {
    @State private var isShowFriends = false
    @State private var isShowProfileSettings = false
    @State private var name = UserDefaults.standard.string(forKey: "name")
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        HStack {
            AvaView(imageName: "Ava")
                .overlay(Circle().stroke(.blue))
                .onTapGesture {
                    isShowProfileSettings.toggle()
                }
            Spacer()
            VStack(alignment: .leading) {
                Text(name ?? "Renata Wollens")
                Text("I live in St.Petersburg/creative")
                HStack {
                    Rect(title: "Friends")
                        .onTapGesture {
                            isShowFriends.toggle()
                        }
                    Rect(title: "Posts")
                    Rect(title: "Likes")
                }
            }
            
        }
        .padding(.horizontal, 40)
        .fullScreenCover(isPresented: $isShowProfileSettings, onDismiss: {
            name = UserDefaults.standard.string(forKey: "name")
        }, content: {
            ProfileSettingsView()
        })
      
        .fullScreenCover(isPresented: $isShowFriends) {
           FriendsView()
        }
    }
}


struct PostProfilView: View {
    @State private var showingProfilOptions = false
    @State private var isShowingEditing = false
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
                VStack(alignment: .leading) {
                    HStack {
                        
                        Text(name)
                            .font(.system(size: height / 45))
                        Text("17 dec at 18:01")
                            .font(.system(size: height / 80))
                        Spacer()
                        Image(systemName: "ellipsis")
                            .onTapGesture {
                                
                                showingProfilOptions.toggle()
                                 
                               
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
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                Image(systemName: "message")
                Text("Liked by 8 987 users")
                Spacer()
            }.padding()
        }
        .fullScreenCover(isPresented: $isShowingEditing, content: {
            NextView(tapy: .edit)
        })
        .actionSheet(isPresented: $showingProfilOptions, content: {
            ActionSheet(title: Text("Post editing"),
                        buttons: [
                            .default(Text("Turn off comments")) {
                                
                            },
                            .default(Text("Edit")) {
                                isShowingEditing.toggle()
                            },
                            
                            
                                .destructive(Text("Delete")) {
                                    
                                },
                            
                                .cancel()
                        ])
        })
    }
}

