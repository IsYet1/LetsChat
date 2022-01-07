//
//  MessageListViewModel.swift
//  LetsChat
//
//  Created by Don McKenzie on 30-Dec-21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct MessageViewState {
    let message: String
    let roomId: String
    let username: String
}

struct MessageViewModel {
    let message: Message
    var messageText: String { message.text }
    var username: String {message.username}
    var messageId: String {message.id ?? "" }
}

class MessageListViewModel: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var messages: [MessageViewModel] = []
    
    func sendMessage(msg: MessageViewState, completion: @escaping () -> Void) {
        
        // Example of using STATE and class init to convert to a model
        // vs = ViewState
        let message = Message(vs: msg)
        
        do {
            _ = try db.collection("rooms")
            .document(message.roomId)
            .collection("messages")
            .addDocument(from: message, encoder: Firestore.Encoder()) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    completion()
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

