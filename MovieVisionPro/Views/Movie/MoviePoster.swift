//
//  MoviePoster.swift
//  MovieVisionPro
//
//  Created by Ivan Alexander Valero on 11/07/2024.
//

import SwiftUI

struct MoviePoster: View {
    let movie: MoviesResponse.Movie
    let movieViewmodel = MovieViewModel()
    
    var body: some View {
        let poster = movie.posterPath
        let urlPoster = movieViewmodel.getImageURL(path: poster ?? "")
        AsyncImage(url: urlPoster) { image in
            image
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
        } placeholder: {
            Image(systemName: "popcorn")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 150, height: 200)
                .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 30))
        }
    }
}

#Preview(windowStyle: .automatic) {
    MoviePoster(movie: .movieTest)
}
