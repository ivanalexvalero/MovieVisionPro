//
//  MovieRowList.swift
//  MovieVisionPro
//
//  Created by Ivan Alexander Valero on 27/06/2024.
//

import SwiftUI

struct MovieRowList: View {
    let movie: MoviesResponse.Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.title ?? "test")
            Text(movie.mediaType ?? "media")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .tag(movie)
    }
}

#Preview(windowStyle: .automatic) {
    MovieRowList(movie: .movieTest)
}
