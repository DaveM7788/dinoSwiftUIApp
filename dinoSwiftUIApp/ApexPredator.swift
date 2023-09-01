//
//  ApexPredator.swift
//  dinoSwiftUIApp
//
//  Created by David McDermott on 9/1/23.
//

import Foundation

// match json data in jpaexpredators.json
// identiable needed for ForEach
struct ApexPredator: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
}

struct MovieScene: Codable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
