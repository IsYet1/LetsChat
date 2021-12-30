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
        let message = Message(vs: msg)
    }
}

