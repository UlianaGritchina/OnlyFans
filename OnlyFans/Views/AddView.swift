//
//  AddView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 25.04.2022.
//

import SwiftUI

struct AddView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var imageData: Data = Data()
    @State private var isShowingPhotoPicker = false
    var body: some View {
        NavigationView {
            ZStack {
                Color("Blue").opacity(0.3).ignoresSafeArea()
                VStack {
                    HStack {
                       
                        Button(action: { isShowingPhotoPicker.toggle() }) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: width / 2, height: height / 20)
                                .foregroundColor(Color("Blue"))
                                .overlay(Text("Choose photo")
                                            .foregroundColor(.black))
                            
                        }
                        Spacer()
                    }
                    .padding()
                    
                    Image(uiImage: UIImage(data: imageData) ?? UIImage(named: "PostImage2")!)
                        .resizable()
                        .frame(width: width - 40, height: height / 3)
                        .cornerRadius(20)
                    
                    

                    HStack {
                        Spacer()
                        NavigationLink("Next", destination: NextView(tapy: .new))
                            .frame(width: width / 3, height: height / 23)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(10)
                            .foregroundColor(.black)

                        
                    }.padding()
                   
                    Spacer()
                }
                
            }
            .sheet(isPresented: $isShowingPhotoPicker, onDismiss: {
                imageData = UserDefaults.standard.data(forKey: "CoverImageData") ?? Data()
            }, content: {
                PhotoPickerView(imageData: imageData)
            })
            .navigationTitle("New publication")
           
        }
        
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
