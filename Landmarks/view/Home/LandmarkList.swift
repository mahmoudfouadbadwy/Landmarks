//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Mahmoud Fouad on 2/14/21.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    private var filteredLandmarks: [Landmark] {
        modelData.landMarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Show Favorites Only")
                    }
                    ForEach(filteredLandmarks) {  landmark in
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                                .contextMenu {
                                    Button(action : {
                                        self.setFavorite(item: landmark)
                                    }) {
                                        HStack {
                                            Text(landmark.isFavorite ?
                                                 "Un Favorite" : "Favorite")
                                            Image(systemName: landmark.isFavorite ? "star.fill": "star")
                                                .foregroundColor(landmark.isFavorite ? Color.yellow : Color.gray)
                                        }
                                    }
                                }
                        }
                    }
                }
            }
            .padding(20)
            .navigationTitle("Landmarks")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    private func setFavorite(item landmark: Landmark) {
        if let index = self.modelData.landMarks
            .firstIndex(where: {$0.id == landmark.id}) {
            self.modelData.landMarks[index].isFavorite.toggle()
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
