//
//  MovieVisionProApp.swift
//  MovieVisionPro
//
//  Created by Ivan Alexander Valero on 11/06/2024.
//

import SwiftUI

@main
struct MovieVisionProApp: App {
    @State var viewModel = MovieViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
        
        WindowGroup(id: "poster") {
            if let selection = viewModel.selection {
                MoviePoster(movie: selection)
            }
        }
        .defaultSize(width: 500, height: 500)
    }
}
