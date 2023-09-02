//
//  PredatorDetail.swift
//  dinoSwiftUIApp
//
//  Created by David McDermott on 9/1/23.
//

import SwiftUI

struct PredatorDetail: View {
    
    let predator: ApexPredator
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing) {
                Image(predator.type)
                    .resizable()
                    .scaledToFit()
                
                Image(predator.name.lowercased().filter { $0 != " "})
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 4)
                    .shadow(color: .white, radius: 1, x: 0, y: 0)
                    .offset(y: -210)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
            
            VStack(alignment: .leading) {
                Text(predator.name)
                    .font(.largeTitle)
                    .padding(.bottom, 8)
                
                Text("Appears in")
                    .font(.title3)
                
                ForEach(predator.movies, id: \.self) { movie in
                    Text("•" + movie)
                        .font(.subheadline)
                }
                
                Text("Movie Moments")
                    .font(.title)
                    .padding(.top, 15)
                
                ForEach(predator.movieScenes) { movieScene in
                    Text(movieScene.movie)
                        .font(.title2)
                        .padding([.top, .bottom], 1)
                    
                    Text(movieScene.sceneDescription)
                        .padding(.bottom, 15)
                }
                
                Text("Read More:")
                    .font(.caption)
                
                Link(predator.link, destination: URL(string: predator.link)!)
                    .font(.caption)
                    .foregroundColor(.blue)
            }
            .padding(.top, -210)
            .padding()
            

        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct PredatorDetail_Previews: PreviewProvider {
    static var previews: some View {
        let movieScene = MovieScene(id: 3, movie: "Blah Movie", sceneDescription: "Blah Blah Scene")
        let movieScene2 = MovieScene(id: 4, movie: "Blah Movie 2", sceneDescription: "Blah Blah Scene 2 fdsfsadfadsfasdfdsafadsfadsfdsafdsafdasfsdafdsafsdafdasfdsafdsafdasfdsafdasfdsafdsafdasfdsafsdafdsafasdfsadfdsafdasfsadfdsafsdafsa")
        let predator = ApexPredator(id: 3, name: "Indoraptor", type: "land", movies: ["Blah Movie"], movieScenes: [movieScene, movieScene2], link: "blahlink")
        
        PredatorDetail(predator: predator)
            .preferredColorScheme(.dark)
    }
}
