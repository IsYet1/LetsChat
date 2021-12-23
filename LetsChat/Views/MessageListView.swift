//
//  MessageListView.swift
//  LetsChat
//
//  Created by Mohammad Azam on 11/10/20.
//

import SwiftUI
import Combine

struct MessageListView: View {
    
    @State private var message: String = ""
    @AppStorage("username") private var username = ""
    
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
                   
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                })
            }.padding()
           
            
            .background(Color(#colorLiteral(red: 0.9483042359, green: 0.9484629035, blue: 0.9482833743, alpha: 1)))
        }
        
        
        .navigationTitle("Room Name")
        
        .onAppear(perform: {
            
        })
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
            .embedInNavigationView()
    }
}
