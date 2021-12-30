//
//  LetsChatApp.swift
//  LetsChat
//
//  Created by Mohammad Azam on 11/9/20.
//

import SwiftUI
import Firebase

@main
struct LetsChatApp: App {
    
    private func setupTheme() {
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navBarAppearance
            .largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navBarAppearance
            .backgroundColor = UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1.0)
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
            
        UINavigationBar.appearance().tintColor = UIColor.white
        
        UIBarButtonItem.appearance()
            .setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
    }
    
    init() {
        setupTheme()
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            RoomListView()
            ContentView()
        }
    }
}
