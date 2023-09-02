//
//  PredatorController.swift
//  dinoSwiftUIApp
//
//  Created by David McDermott on 9/1/23.
//

import Foundation

// corresponds to ApexPredator Model files
class PredatorController {
    
    private var allApexPredators: [ApexPredator] = []
    var apexPredators: [ApexPredator] = []
    let typeFilters = ["All", "Land", "Air", "Sea"]
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                // error is built-in for do-try-catch
                print("Error decoding json data: \(error)")
            }
        }
    }
    
    func sortByAlphabetical() {
        apexPredators.sort(by: { $0.name < $1.name })
    }
    
    func sortByMovieAppearance() {
        apexPredators.sort(by: { $0.id < $1.id })
    }
    
    func typeIcon(for type: String) -> String {
        switch type {
        case "All": return "square.stack.3d.up.fill"
        case "Land": return "leaf.fill"
        case "Air": return "wind"
        case "Sea": return "drop.fill"
        default: return "questionmark"
        }
    }
    
    func filterBy(type: String) {
        switch type {
        case "Air", "Land", "Sea":
            apexPredators = allApexPredators.filter { $0.type == type.lowercased() }
        default: apexPredators = allApexPredators
        }
    }
}
