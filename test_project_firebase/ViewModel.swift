//
//  ViewModel.swift
//  test_project_firebase
//
//  Created by Владимир Ширяев on 09.01.2022.
//

import Foundation
import Firebase
//import FirebaseFirestore

class ViewModel: ObservableObject {
    @Published var list = [Todo]()
    func updateData(todoToUpdate: Todo) {
        let db = Firestore.firestore()
        db.collection("todos").document(todoToUpdate.id).setData(["name": "update: \(todoToUpdTE.name)"], merge: true) { error in
            if error == nil {
                self.getData()
            }
        }
    }
    
    
    
    
    func deleteData(todoToDelete: Todo) {
        let db = Firestore.firestore()
        db.collection("todos").document(todoToDelete.id).delete { error in
            if error == nil{
                DispatchQueue.main.async {
                    self.list.removeAll {todo in
                    return todo.id == todoToDelete.id
                }
                }
            }
                
        }
    }
    
    
    
    func addData (name: String, age: String){
        let db = Firestore.firestore()
        
        db.collection("todos").addDocument(data: ["name":name, "age":age]) {error in
            if error == nil {
                self.getData()
            }else {
                
            }
        }
    }
    func getData() {
        let db = Firestore.firestore()
        
        db.collection("todos").getDocuments {snapshot, error in
            
            if error == nil {
                // No errors
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        
                        self.list = snapshot.documents.map { d in
                            return Todo(id: d.documentID, name: d["name"] as? String ?? "", age: d["age"] as? String ?? "")
                        }  
                    }
                }
            } else {
                // handle the error
            }
        }
    }
}
