//
//  RoomListView.swift
//  LetsChat
//
//  Created by Mohammad Azam on 11/9/20.
//

import SwiftUI

struct RoomListView: View {
    
    @State private var isPresented: Bool = false
   
    
    var body: some View {
        VStack {
            
        }
        .navigationTitle("Rooms")
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }, label: {
            Image(systemName: "plus")
                .font(.title)
                .foregroundColor(.white)
        }))
        
        .sheet(isPresented: $isPresented, onDismiss: {
            
        }, content: {
            AddRoomView() 
        })
        
        .onAppear(perform: {
            
        })
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView()
            .embedInNavigationView()
    }
}


