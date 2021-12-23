//
//  AddRoomView.swift
//  LetsChat
//
//  Created by Mohammad Azam on 11/9/20.
//

import SwiftUI

struct AddRoomView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var addRoomVM = AddRoomViewModel()
   
    var body: some View {
        VStack {
            
            Form {
                TextField("Enter name", text: $addRoomVM.name)
                TextField("Enter description", text: $addRoomVM.description)
                
            }
            
            Button("Save") {
                addRoomVM.createRoom {
                    presentationMode.wrappedValue.dismiss()
                }
                
            }.buttonStyle(PrimaryButtonStyle())
            .padding()
            
            Spacer()
            
        }.navigationTitle("Add New Room")
        .embedInNavigationView()
    }
}

struct AddRoomView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoomView()
    }
}
