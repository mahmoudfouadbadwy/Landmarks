//
//  Landmark Detail.swift
//  Landmarks
//
//  Created by Mahmoud Fouad on 2/14/21.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    private var landmarkIndex: Int {
        modelData.landMarks.firstIndex(where: { $0.id == landmark.id })!
            
    }
    var body: some View {
        ScrollView {
            
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame( height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                Text(landmark.name)
                    .font(.title)
                    .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landMarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Landmark_Detail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landMarks[0])
            .environmentObject(modelData)
    }
}



