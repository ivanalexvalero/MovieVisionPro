//
//  MovieDetail.swift
//  MovieVisionPro
//
//  Created by Ivan Alexander Valero on 27/06/2024.
//

import SwiftUI

struct MovieDetail: View {
    @Environment(\.openWindow) private var open
    
    let movie: MoviesResponse.Movie
    let movieViewmodel = MovieViewModel()
    
    var body: some View {
        let poster = movie.posterPath
        let backdrop = movie.backdropPath
        let urlPoster = movieViewmodel.getImageURL(path: poster ?? "")
        let urlBackdrop = movieViewmodel.getImageURL(path: backdrop ?? "")
        ZStack {
            
            AsyncImage(url: urlBackdrop) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.top)
                    .blur(radius: 8)
                
            } placeholder: {}
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 15)
            
            ScrollView {
                HStack(alignment: .top) {
                    VStack {
                        AsyncImage(url: urlPoster) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        } placeholder: {
                            Image(systemName: "popcorn")
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .frame(width: 150, height: 200)
                                .glassBackgroundEffect(in: RoundedRectangle(cornerRadius: 30))
                        }
                        
                        Button {
                            open(id: "poster")
                        } label: {
                            Text("Mostrar poster")
                        }
                        .padding()
                        
                    }
                    VStack(alignment: .leading) {
                        Text(movie.title ?? "title")
                            .font(.title)
                            .bold()
                        Text(movie.overview ?? "detail")
                            .padding(4)
                        Text(movie.mediaType ?? "media type")
                            .padding(8)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .padding(.top, 30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .scrollBounceBehavior(.basedOnSize)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview(windowStyle: .automatic) {
    MovieDetail(movie: .movieTest)
}
