//
//  RegisterView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 18.04.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var isShowTabBarView = false
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            LoginBack()
            VStack {
                CustomNavigateion(title: "Register")
                Spacer()
                TFCapsule(title: "Full name", value: $name).padding()
                TFCapsule(title: "E-mail", value: $email)
                TFCapsule(title: "Password", value: $password).padding()
                
                LoginButton(title: "Register", action: {
                    isShowTabBarView.toggle()
                    DataManager.shared.saveEmail(mail: email)
                    
                }).padding(.top, height / 12)
                
                LogWithView()
                Spacer()
                Spacer()
            }
        }
        
        .fullScreenCover(isPresented: $isShowTabBarView) {
            TapBarView()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
