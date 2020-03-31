//
//  MovieService.swift
//  MovieList
//
//  Created by Askar Mustafin on 3/31/20.
//  Copyright © 2020 Ainur. All rights reserved.
//

import Foundation

struct MovieService {
    
    typealias MovieSearchResponse = (([MovieTitle]?, ApiError?)->())
    
    static func searchMovie(query: String, completionHanler: @escaping MovieSearchResponse) {
        let session = URLSession.shared
        session.dataTask(with: Router.getRequest(.search(query))()) {
            (data, response, error) in
            
            if error != nil || data == nil {
                completionHanler(nil, ApiError.clientError)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completionHanler(nil, ApiError.serverError)
                return
            }
            
            guard let data = data else {
                completionHanler(nil, ApiError.noData)
                return
            }
            do {
                let result = try JSONDecoder().decode(SearchResult.self, from: data)
                
                completionHanler(result.titles, nil)
                
            } catch {
                print("error \(error.localizedDescription)")
            }

        }.resume()
    }
}
