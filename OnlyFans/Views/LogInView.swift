//
//  LogInView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 18.04.2022.
//

import SwiftUI

struct LogInView: View {
    @State private var isShowNews = false
    @State private var email = ""
    @State private var password = ""
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            LoginBack()
            VStack {
                CustomNavigateion(title: "Login")
                Spacer()
                ZStack {
                    TFCapsule(title: "E-mail", value: $email).padding()
                    Capsule()
                        .stroke()
                        .frame(width: width - 40, height: height / 20)
                        .foregroundColor(email == DataManager.shared.getEmail() ? .white : .red)
                }
                TFCapsule(title: "Password", value: $password)
                LoginButton(title: "Login", action: {
                    if email == DataManager.shared.getEmail() {
                        isShowNews = true
                    } else {
                        isShowNews = false
                    }
                    
                    
                }).padding(.top, height / 10)
                LogWithView()
                Spacer()
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $isShowNews) {
            TapBarView()
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

struct LoginBack: View {
    var body: some View {
        Image("LogInBack")
            .resizable()
            .ignoresSafeArea()
    }
}

struct TFCapsule: View {
    let title: String
    @Binding var value: String
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        Capsule()
            .stroke(.white)
            .frame(width: width - 40, height: height / 20)
            .overlay(
                TextField(title, text: $value)
                    .padding()
            )

    }
}

struct LoginButton: View {
    let title: String
    let action: () -> Void
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        Button(action: {action()}) {
            Capsule()
                .frame(width: width - 40, height:  height / 20)
                .foregroundColor(.white)
                .opacity(0.6)
                .overlay(Text(title)
                            .foregroundColor(.black)
                )
        }
        
    }
}

struct CustomNavigateion: View {
    let title: String
    @Environment(\.presentationMode) var presentationMode
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        HStack {
            Text(title).font(.system(size: height / 30)).padding(.horizontal)
                Spacer()
            Button(action: {presentationMode.wrappedValue.dismiss()}) {
                Image(systemName: "multiply")
                    .foregroundColor(.black)
                    .font(.system(size: height / 30))
            }
                
        }.padding()
    }
}
