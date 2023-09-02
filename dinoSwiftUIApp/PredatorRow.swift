//
//  PredatorRow.swift
//  dinoSwiftUIApp
//
//  Created by David McDermott on 9/1/23.
//

import SwiftUI

struct PredatorRow: View {
    
    let predator: ApexPredator
    
    var body: some View {
        HStack {
            
            // image names are all lowercase, no spaces, same name though
            Image(predator.name.lowercased().filter { $0 != " "})
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(color: .white, radius: 1, x: 0, y: 0)
            
            VStack(alignment: .leading) {
                Text(predator.name)
                    .fontWeight(.bold)
                
                Text(predator.type.capitalized)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 13)
                    .padding(.vertical, 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(predator.typeOverlay().opacity(0.33))
                    )
            }
        }
    }
}

struct PredatorRow_Previews: PreviewProvider {
    static var previews: some View {
        let movieScene = MovieScene(id: 3, movie: "Blah Movie", sceneDescription: "Blah Blah Scene")
        let predator = ApexPredator(id: 3, name: "Indoraptor", type: "Land", movies: ["Blah Movie"], movieScenes: [movieScene], link: "blahlink")
        PredatorRow(predator: predator)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
