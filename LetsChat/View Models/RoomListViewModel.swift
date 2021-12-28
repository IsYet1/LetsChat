//
//  RoomListViewModel.swift
//  LetsChat
//
//  Created by Don McKenzie on 28-Dec-21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct RoomViewModel {
    let room: Room
    
    var name: String {
        room.name
    }
    
    var description: String {
        room.description
    }
    
    var roomId: String {
        room.id ?? ""
    }
}

class RoomListViewModel: ObservableObject {
    @Published var rooms: [RoomViewModel] = [];
    let db = Firestore.firestore()
    
    func getAllRooms() {
        db.collection("rooms")
            .getDocuments { (snapshot, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let snapshot = snapshot {
                        let rooms: [RoomViewModel] = snapshot.documents.compactMap {doc in
                            guard var room = try? doc.data(as: Room.self) else {
                                return nil
                            }
                            
                            room.id = doc.documentID
                            return RoomViewModel(room: room)
                        }
                        
                        DispatchQueue.main.async {
                            self.rooms = rooms
                        }
                    }
                }
            }
    }
    
}


