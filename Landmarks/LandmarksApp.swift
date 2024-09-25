//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Mahmoud Fouad on 2/14/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(ModelData())
        }
    }
}

