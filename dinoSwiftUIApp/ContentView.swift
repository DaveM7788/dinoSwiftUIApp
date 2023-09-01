//
//  ContentView.swift
//  dinoSwiftUIApp
//
//  Created by David McDermott on 8/30/23.
//

import SwiftUI

struct ContentView: View {
    
    let apController = PredatorController()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(apController.apexPredators) { predator in
                    NavigationLink(destination: Text("placeholder")) {
                        Text(predator.name)
                    }
                }
            }.navigationTitle("Apex Predators")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
