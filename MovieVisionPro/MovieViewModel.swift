//
//  MovieViewModel.swift
//  MovieVisionPro
//
//  Created by Ivan Alexander Valero on 11/06/2024.
//

import Foundation
import Observation

@Observable
class MovieViewModel {
    
    var movies: [MoviesResponse.Movie] = []
    var selection: MoviesResponse.Movie?
    var selectionPerfilUser: PerfilUserModel?
    var errorMessage: String?
    
    init() {
        getTrendingMovies()
    }
    
    func getTrendingMovies() {
        Task {
            do {
                guard let url = MovieViewModelConstants.url else { return }
                guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
                components.queryItems = [
                    URLQueryItem(name: "language", value: "en-US"),
                ]
                
                var request = URLRequest(url: components.url!)
                request.httpMethod = "GET"
                request.timeoutInterval = 10
                request.allHTTPHeaderFields = [
                    "accept": "application/json",
                    "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OTY3YTIxMjQ5ODdmZTk2YzM0ZmRiYTBkMDNmYzAyZCIsInN1YiI6IjYzMmI4Mzc2NmNhOWEwMDA3YTA0OTFkMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sKzGpY1T4ys1TfWTNEQffzRCWCg3HzDZPYcwoYmsI5s"
                ]
                
                let (data, _) = try await URLSession.shared.data(for: request)
                let response = try JSONDecoder().decode(MoviesResponse.self, from: data)
                self.movies = response.results
            } catch {
                self.errorMessage = "Error al decodificar los datos: \(error.localizedDescription)"
                self.movies = []
            }
        }
    }
    
    func getImageURL(path: String) -> URL? {
        return URL(string: MovieViewModelConstants.baseURL + path)
    }
}

