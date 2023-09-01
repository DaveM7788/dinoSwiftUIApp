//
//  PredatorController.swift
//  dinoSwiftUIApp
//
//  Created by David McDermott on 9/1/23.
//

import Foundation

// corresponds to ApexPredator Model files
class PredatorController {
    
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                // error is built-in for do-try-catch
                print("Error decoding json data: \(error)")
            }
        }
    }
}
