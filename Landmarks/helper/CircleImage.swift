//
//  CircleImage.swift
//  Landmarks
//
//  Created by Mahmoud Fouad on 2/14/21.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
       image
            .clipShape(Circle())
            .overlay(Circle()
                        .stroke(Color.gray, lineWidth: 2)
            )
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
