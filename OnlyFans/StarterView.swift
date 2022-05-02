//
//  ContentView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 18.04.2022.
//

import SwiftUI


class DataManager {
    
    static let shared = DataManager()
    
    func saveEmail(mail: String) {
        UserDefaults.standard.set(mail, forKey: "mail")
    }
    
    func getEmail() -> String {
        UserDefaults.standard.string(forKey: "mail") ?? "no"
    }
    
}
struct StatrerView: View {
    @State private var showLoginVew = false
    @State private var showRegisterView = false
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            Back()
            VStack {
                ButtonView(title: "Login",
                           action: {showLoginVew.toggle()}).padding()
                
                ButtonView(title: "Register",
                           action: {showRegisterView.toggle()})
                
                LogWithView()
                
            }.offset(y: height / 15)
        }
        .fullScreenCover(isPresented: $showLoginVew) {
            LogInView()
        }
        .fullScreenCover(isPresented: $showRegisterView) {
            RegisterView()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StatrerView()
            .preferredColorScheme(.light)
    }
}

struct Back: View {
    let width = UIScreen.main.bounds.width
    var body: some View {
        Image("Back")
            .resizable()
            .frame(width: width + 30, height: .infinity)
            .ignoresSafeArea()
    }
}

struct ButtonView: View {
    let title: String
    let action: () -> Void
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        Button(action: {action()}) {
            ZStack {
                Capsule()
                    .frame(width: width - 40, height: height / 15)
                    .foregroundColor(Color("Blue"))
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: height / 45))
            }
            
        }.padding()
    }
}

struct LogWithView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        VStack {
            Text("Login with")
                .padding(.top, height / 35)
            
            HStack(spacing: height / 30) {
                Button(action: {}) {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: width / 9, height: width / 9)
                        Text("G")
                            .bold()
                            .font(.system(size: height / 30))
                    }.foregroundColor(.black)
                }
                
                Button(action: {}) {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: width / 9, height: width / 9)
                        Image(systemName: "applelogo")
                            .font(.system(size: height / 35))
                            .offset(y: -2)
                    }
                }
                .foregroundColor(.black)
            }
        }
    }
}
