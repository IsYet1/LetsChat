//
//  MessageListView.swift
//  LetsChat
//
//  Created by Mohammad Azam on 11/10/20.
//

import SwiftUI
import Combine

struct MessageListView: View {
    
    let room: RoomViewModel
    
    @StateObject private var messageListVM = MessageListViewModel()
    
    @State private var message: String = ""
    @AppStorage("username") private var username = ""
    
    private func sendMessage() {
        let messageVS = MessageViewState(message: message, roomId: room.roomId, username: username)
        
        messageListVM.sendMessage(msg: messageVS) {
            print("Message sent successfully")
            message = ""
        }
    }
    
    var body: some View {
        
        VStack {
            ScrollView {
                ScrollViewReader { scrollView in
                    VStack {
                       
                    }.onAppear(perform: {
                            
                          
                    })
                }
            }
            
            Spacer()
            
            HStack {
                TextField("Write message here", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                   
                    sendMessage()
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                })
            }.padding()
           
            
            .background(Color(#colorLiteral(red: 0.9483042359, green: 0.9484629035, blue: 0.9482833743, alpha: 1)))
        }
        
        
        .navigationTitle(room.name)
        
        .onAppear(perform: {
            messageListVM.registerUpdatesForRoom(room: room)
        })
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView(room: RoomViewModel(room: Room(name: "Room Preview", description: "Preview Room")))
            .embedInNavigationView()
    }
}
