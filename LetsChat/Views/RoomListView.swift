//
//  RoomListView.swift
//  LetsChat
//
//  Created by Mohammad Azam on 11/9/20.
//

import SwiftUI

struct RoomListView: View {
    
    @State private var isPresented: Bool = false
    @StateObject private var roomListVM = RoomListViewModel()
    @AppStorage("username") private var username = ""
    
    var body: some View {
        VStack {
            List(roomListVM.rooms, id: \.roomId) {room in
                NavigationLink(
                    destination: MessageListView(room: room),
                    label: {
                        RoomCell(room: room)
                    }
                )
            }.listStyle(PlainListStyle())
        }
        .navigationTitle("Rooms (\(username))")
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
            roomListVM.getAllRooms()
        })
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView()
            .embedInNavigationView()
    }
}

struct RoomCell: View {
    let room: RoomViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(room.name).font(.headline)
            Text(room.description)
        }
    }
}


