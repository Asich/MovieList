//
//  Movie.swift
//  MovieList
//
//  Created by Ainur on 3/29/20.
//  Copyright © 2020 Ainur. All rights reserved.
//

import Foundation

class Cast: Codable {
    let actor: String
//    let actorId: String
//    let character: String
    
    init(actor: String, actorId: String, character: String) {
        self.actor = actor
//        self.actorId = actorId
//        self.character = character
    }
}



class Movie: Codable {
    let id: String
    let title: String
    let year: String
    let length: String
    let rating: String
    let poster: String
    let plot: String
    let cast: [Cast]

    init(id: String, title: String, year: String, length: String, rating: String, rating_votes: String, poster: String, plot: String, cast: [Cast]) {
        self.id = id
        self.title = title
        self.year = year
        self.length = length
        self.rating = rating
        self.poster = poster
        self.plot = plot
        self.cast = cast
    }
    
    func getPoster() -> URL {
        var url = URL(string: "https://i.picsum.photos/id/866/200/300.jpg")
        if !poster.isEmpty {
           url = URL(string: poster)
        }
        return url!
    }
}



class MovieTitle: Codable {
    let id: String
//    let image: String
    let title: String
    
    init(id: String, image: String, title: String) {
        self.id = id
//        self.image = image
        self.title = title
    }
}

class SearchResult: Codable {
    let titles: [MovieTitle]
       
    init(titles: [MovieTitle]) {
        self.titles = titles
    }
}
