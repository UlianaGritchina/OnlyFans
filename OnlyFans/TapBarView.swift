//
//  TapBarView.swift
//  OnlyFans
//
//  Created by Ульяна Гритчина on 19.04.2022.
//

import SwiftUI

struct TapBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            NotificationsView()
                .tabItem {
                    Label("Notifications", systemImage: "bell")
                }
            AddView()
                .tabItem {
                    Label("Add", systemImage: "plus.square")
                }
            
            MassagesView()
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
            
        }
    }
}

struct TapBarView_Previews: PreviewProvider {
    static var previews: some View {
        TapBarView()
    }
}
