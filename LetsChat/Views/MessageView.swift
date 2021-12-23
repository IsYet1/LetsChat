//
//  MessageView.swift
//  LetsChat
//
//  Created by Mohammad Azam on 11/11/20.
//

import SwiftUI

enum MessageStyle {
    case primary
    case secondary
}

struct MessageView: View {
    
    let messageText: String
    let username: String
    let style: MessageStyle
    
    var body: some View {
        VStack(alignment: style == .primary ? .trailing : .leading) {
            
            if style == .primary {
                Text(messageText).withPrimaryTextStyle()
                    .lineLimit(nil)
            } else {
                Text(messageText).withSecondaryTextStyle()
                    .lineLimit(nil)
            }
            
            Text(username)
                .font(.caption)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(messageText: "Hello This is a message!", username: "AzamSharp", style: .primary)
    }
}
