//
//  kebhubApp.swift
//  kebhub
//
//  Created by Simone Tesini on 24/10/23.
//

import SwiftUI
import SwiftData

@main
struct kebhubApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Kebabbaro.self)
    }
}
