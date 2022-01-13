//
//  test_project_firebaseApp.swift
//  test_project_firebase
//
//  Created by Владимир Ширяев on 08.01.2022.
//

import SwiftUI
import Firebase
@main
struct test_project_firebaseApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
