//
//  MovieView.swift
//  MovieVisionPro
//
//  Created by Ivan Alexander Valero on 12/07/2024.
//

import SwiftUI

struct MovieView: View {
    @Environment(MovieViewModel.self) private var movieViewModel
//    let movie: MoviesResponse.Movie
    
    var body: some View {
        @Bindable var bindableViewModel = movieViewModel
        NavigationSplitView {
            List(selection: $bindableViewModel.selection) {
                ForEach(movieViewModel.movies) { movie in
                    MovieRowList(movie: movie)
                }
            }
            .navigationTitle("Movies")
            .font(.headline)
            .navigationSplitViewColumnWidth(250)
        } detail: {
            VStack {
                VStack(alignment: .leading) {
                    if let selection = movieViewModel.selection {
                        MovieDetail(movie: selection)
                        //                            Text(selection.title ?? "Titulo de la peli")
                    } else {
                        ContentUnavailableView("Selecciona una pelicula", systemImage: "popcorn", description: Text("Por favor, selecciona una pelicula de la grilla lateral"))
                    }
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("Movie Vision Pro App")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.leading)
                }
            }
        }
        .tabItem {
            Label("Peliculas", systemImage: "popcorn")
        }
        .ornament(attachmentAnchor: .scene(.top)) {
            VStack {
                Text("Movie app VisionPro te trae lo último del cine")
            }
            .frame(width: 400, height: 60)
            .glassBackgroundEffect()
        }
    }
}

