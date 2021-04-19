//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Mahmoud Fouad on 2/14/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var model = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}

