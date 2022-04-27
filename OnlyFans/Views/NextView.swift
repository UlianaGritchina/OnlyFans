//
//  NextView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 25.04.2022.
//

import SwiftUI

enum PostTapy {
    case new
    case edit
}
struct NextView: View {
    @State private var isOn = false
    @Environment(\.presentationMode) var presentationMode
    let tapy: PostTapy
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let imageData = UserDefaults.standard.data(forKey: "CoverImageData") ?? Data()
    @State private var text = "Add a description to the post"
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("Blue")
                    .opacity(0.3)
                    .ignoresSafeArea()
                VStack {
                    AvaView(imageName: "Ava")
                        .frame(height: 70)
                    Text("Renata Wollens")
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(width: width - 40 , height: height / 5)
                    
                        .overlay (
                            HStack {
                                TextEditor(text: $text)
                                Spacer()
                                Image(uiImage: UIImage(data: imageData)!)
                                    .resizable()
                                    .frame(width: width / 3, height: height / 6)
                                    .cornerRadius(20)
                            }.padding()
                        )
                    
                    
                    
                    Toggle(isOn: $isOn) {
                        Text("Allow comments")
                    }
                    
                    Spacer()
                    Button(action: {
                        if tapy == .edit {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        Capsule()
                            .overlay(Text("Publish").foregroundColor(.black))
                            .frame(width: width / 2, height: height / 20)
                            .foregroundColor(Color("Blue"))
                    }
                    
                    
                    Spacer()
                }
                .padding()
                .navigationTitle( tapy == .new ? "New Publication" : "Edit")
            }
        }
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView(tapy: .new)
    }
}
