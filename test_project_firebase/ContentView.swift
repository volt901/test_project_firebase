//
//  ContentView.swift
//  test_project_firebase
//
//  Created by Владимир Ширяев on 08.01.2022.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @ObservedObject var model = ViewModel()
    @State var name = ""
    @State var age = ""
    
    var body: some View {
        VStack{
            
            List (model.list) { item in
                HStack {
                Text(item.age)
                    Spacer()
                    Button(action: {
                        model.updateData(todoToUpdate: item)
                    }, label: {
                        Image(systemName: "pencil")
                    }).buttonStyle(.plain)
                    Spacer()
                    Button(action: {
                        model.deleteData(todoToDelete: item)
                    }, label: {
                        Image(systemName: "minus")
                    }).buttonStyle(.bordered)
                }
            }
            Divider()
            VStack (spacing: 5){
                TextField ("Name", text: $name).textFieldStyle(.roundedBorder)
                TextField ("Age", text: $age).textFieldStyle(.roundedBorder)
                
                Button (action: {
                    model.addData(name: name, age: age)
                }, label: {
                    Text("Add Todo:")
                })
            }
            .padding()
        }
    }
    init() {
        model.getData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
