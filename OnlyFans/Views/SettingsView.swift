//
//  SettingsView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 19.04.2022.
//

import SwiftUI

struct SettingsView: View {
    @State private var showAlert = false
    @State private var showStarterView = false
    @State private var showRestPasswordAlert = false
    @State private var showRestDeleteAlert = false
    let height = UIScreen.main.bounds.height
    var body: some View {
        NavigationView {
            ZStack {
                Color("Blue").opacity(0.3)
                    .ignoresSafeArea()
                VStack {
                    Title2View().offset(y: -height / 10)
                    
                    VStack(spacing: height / 10) {
                        Text("Settings")
                            .font(.system(size: height / 30))
                        
                        VStack(spacing: height / 30) {
                            Button("Reset Notifications >") {
                                showAlert.toggle()
                                showRestPasswordAlert = false
                            }
                            
                            
                            Button("Log Out >") {
                               
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(title:
                                        showRestDeleteAlert ? Text("Your account will be permanently deleted!") :
                                        showRestPasswordAlert
                                      ? Text("Your password has been reset!")
                                      : Text("Your push notification preferences are reset."),
                                      
                                      message:
                                        showRestDeleteAlert ? Text("All user data with this account will be irretrievably lost. Alternatively, you can create a new account and continue to use the service.") :
                                        showRestPasswordAlert
                                      ? Text("A link to reset your password has been sent to your email.")
                                      : Text(""),
                                      
                                      
                                      dismissButton: .default ( showRestDeleteAlert ? Text("I agree") : Text("Done")))
                                
                            }
                            
                            
                            Button("Reset Password >") {
                                showAlert.toggle()
                                showRestPasswordAlert = true
                                showRestDeleteAlert = false
                            }
                            
                            
                            Button("Support >") {
                                
                            }
                            
                            Button("Delete Account >") {
                                
                                showRestDeleteAlert = true
                                
                            }
                            .alert(isPresented: $showRestDeleteAlert) {
                                Alert(title: Text("Your account will be permanently deleted!"), message: Text("All user data with this account will be irretrievably lost. Alternatively, you can create a new account and continue to use the service."),
                                      
                                      primaryButton: .default(Text("I agree")) { },
                                      secondaryButton: .cancel())
                            }
                            
                        }.foregroundColor(.black)
                    }
                    Spacer()
                    
                }
            }
        }
        
        
        .fullScreenCover(isPresented: $showStarterView, content: {
            StatrerView()
        })
        
        
        
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
