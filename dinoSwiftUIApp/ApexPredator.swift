//
//  ApexPredator.swift
//  dinoSwiftUIApp
//
//  Created by David McDermott on 9/1/23.
//

import Foundation
import SwiftUI

// match json data in jpaexpredators.json
// identiable needed for ForEach
struct ApexPredator: Codable, Identifiable {
    let id: Int  // needed to conform to identifiable
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    func typeOverlay() -> Color {
        switch type {
        case "land": return .brown
        case "sea": return .blue
        case "air": return .green
        default: return .brown
        }
    }
}

struct MovieScene: Codable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
