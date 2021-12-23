//
//  ContentView.swift
//  LetsChat
//
//  Created by Mohammad Azam on 11/9/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usernameEntry: String = ""
    @State private var isActive: Bool = false
    @AppStorage("username") private var username = ""
    
    var body: some View {
        VStack {
           
            Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            TextField("Enter username", text: $usernameEntry)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Enter") {
                isActive = true
                username = usernameEntry
               
            }.buttonStyle(PrimaryButtonStyle())
            
            NavigationLink(
                destination: RoomListView(),
                isActive: $isActive,
                label: {
                    EmptyView()
                })
            
            Spacer()
        }.padding()
        .embedInNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
