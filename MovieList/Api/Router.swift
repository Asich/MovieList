//
//  Router.swift
//  MovieList
//
//  Created by Askar Mustafin on 3/31/20.
//  Copyright © 2020 Ainur. All rights reserved.
//

import Foundation

enum Router {
    case search(String)
    case details(String)
    
    private func getUrl() -> URL {
        switch self {
        case let .search(query):
            return URL(string: API.url + "/search/\(query)")!
        case let .details(id):
            return URL(string: API.url + "/film/\(id)")!
        }
    }
    
    public func getRequest() -> URLRequest {
        let url = getUrl()
        var request = URLRequest(url: url)
        request.setValue(API.key, forHTTPHeaderField: "x-rapidapi-key")
        return request
    }
}
