//
//  LogInView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 18.04.2022.
//

import SwiftUI

struct LogInView: View {
    @State private var isShowNews = false
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            LoginBack()
            VStack {
                CustomNavigateion(title: "Login")
                Spacer()
                TFCapsule(title: "E-mail").padding()
                TFCapsule(title: "Password")
                LoginButton(title: "Login", action: {isShowNews.toggle()}).padding(.top, height / 10)
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
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        Capsule()
            .stroke(.white)
            .frame(width: width - 40, height: height / 20)
            .overlay(
                TextField(title, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
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
