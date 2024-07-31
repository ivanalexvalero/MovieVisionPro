//
//  MovieModel.swift
//  MovieVisionPro
//
//  Created by Ivan Alexander Valero on 11/06/2024.
//

import Foundation

// Modelo para el objeto principal
struct MoviesResponse:  Decodable, Hashable {
    let page: Int
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
    }
    
    struct Movie: Identifiable, Decodable, Hashable {
        let backdropPath: String?
        let id: Int?
        let originalTitle: String?
        let overview: String?
        let posterPath: String?
        let mediaType: String?
        let title: String?

        // Mapear los nombres de las claves del JSON con los nombres de las propiedades
        enum CodingKeys: String, CodingKey {
            case backdropPath = "backdrop_path"
            case id
            case originalTitle = "original_title"
            case overview
            case posterPath = "poster_path"
            case mediaType = "media_type"
            case title
        }
    }
}

