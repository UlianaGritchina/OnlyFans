//
//  RegisterView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 18.04.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var isShowTabBarView = false
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            LoginBack()
            VStack {
                CustomNavigateion(title: "Register")
                Spacer()
                TFCapsule(title: "Full name").padding()
                TFCapsule(title: "E-mail")
                TFCapsule(title: "Password").padding()
                
                LoginButton(title: "Register", action: {isShowTabBarView.toggle()}).padding(.top, height / 12)
                
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
