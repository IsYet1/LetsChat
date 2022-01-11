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
    @State private var cancellable: AnyCancellable?
    
    private func sendMessage() {
        let messageVS = MessageViewState(message: message, roomId: room.roomId, username: username)
        
        messageListVM.sendMessage(msg: messageVS) {
            print("Message sent successfully")
            message = ""
        }
    }
    
    var body: some View {
        
        VStack {
            // ScrollView will automatically scroll when the content changes
            ScrollView {
                ScrollViewReader { scrollView in
                    VStack {
                        ForEach(messageListVM.messages, id: \.messageId) {message in
                            HStack {
                                if message.username == username {
                                    Spacer()
                                    MessageView(messageText: message.messageText, username: message.username, style: .primary)
                                } else {
                                    MessageView(messageText: message.messageText, username: message.username, style: .secondary)
                                    Spacer()
                                }
                            }.padding()
                            .id(message.messageId)
                        }
                    }.onAppear(perform: {
                        
                        cancellable = messageListVM.$messages.sink{ messages in
                            if messages.count > 0 {
                                DispatchQueue.main.async {
                                    withAnimation{
                                        scrollView.scrollTo(messages[messages.endIndex - 1].messageId, anchor: .bottom)
                                    }
                                }
                            }
                        }
                          
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
        
        
        .navigationTitle("\(room.name) - (\(username))")
        
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
