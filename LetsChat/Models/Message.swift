//
//  Message.swift
//  LetsChat
//
//  Created by Don McKenzie on 30-Dec-21.
//

import Foundation

struct Message: Codable {
    
    var id: String?
    var text: String = ""
    var username: String = ""
    var roomId: String = ""
    var messageDate = Date()
    
    init(vs: MessageViewState) {
        text = vs.message
        username = vs.username
        roomId = vs.roomId
        
    }
}
