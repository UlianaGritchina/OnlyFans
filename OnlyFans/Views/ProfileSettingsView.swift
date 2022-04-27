//
//  ProfileSettingsView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 19.04.2022.
//

import SwiftUI

struct ProfileSettingsView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var name = "Renata Wollens"
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color("Blue")
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Title2View()
                    HStack {
                        Spacer()
                        Button(action: {
                            UserDefaults.standard.set(name, forKey: "name")
                            presentationMode.wrappedValue.dismiss()
                            
                        }) {
                            Text("Save").foregroundColor(.black)
                        }
                    }.padding(.horizontal, width / 10)
                }
                
                Text("Edit Profile")
                    .font(.system(size: height / 30))
                ZStack {
                    AvaView(imageName: "Ava")
                        .frame(width: width / 4, height: height / 10)
                    Image(systemName: "camera")
                        .foregroundColor(.white)
                        .font(.system(size: height / 25))
                        .opacity(0.7)
                }
                Text("Edit photo profile")
                    .font(.system(size: height / 50))
                
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .frame(width: width, height: height / 4)
                    .overlay(
                    
                        HStack {
                            VStack(alignment: .leading, spacing: height / 35) {
                                Text("Name")
                                Text("E-mail")
                                Text("Date of Birth")
                                Text("Profile description")
                                    
                            }.font(.system(size: height / 50))
                            Spacer()
                            VStack() {
                                VStack {
                                    TextField("", text: $name)
                                        .frame(width: width / 2, height: 30)
                                    RoundedRectangle(cornerRadius: 2)
                                        .frame(width: width / 2, height: 1)
                                    
                                    TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                        .frame(width: width / 2, height: 30)
                                    RoundedRectangle(cornerRadius: 2)
                                        .frame(width: width / 2, height: 1)
                                    
                                    TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                        .frame(width: width / 2, height: 30)
                                    RoundedRectangle(cornerRadius: 2)
                                        .frame(width: width / 2, height: 1)
                                    
                                    TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                        .frame(width: width / 2, height: 30)
                                    RoundedRectangle(cornerRadius: 2)
                                        .frame(width: width / 2, height: 1)
                                }
   
                            }.font(.system(size: height / 50))
                            
                        }.padding()
                    )
                
                
                
                Spacer()
            }
        }
    }
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
