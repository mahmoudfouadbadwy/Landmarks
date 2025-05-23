//
//  ModelData.swift
//  Landmarks
//
//  Created by Mahmoud Fouad on 2/14/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landMarks: [Landmark] = []
    
    init() {
        Task {
            try await getData()
        }
    }
    
    func getData() async throws -> Void {
        let result: [Landmark] = try await load("landmarkData.json")
        await MainActor.run {
            self.landMarks = result
        }
    }
}



func load<T: Decodable>(_ filename: String) async throws ->  T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        throw("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        throw("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        throw("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

extension String: @retroactive Error {}
