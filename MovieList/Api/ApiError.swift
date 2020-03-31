//
//  ApiError.swift
//  MovieList
//
//  Created by Askar Mustafin on 3/31/20.
//  Copyright © 2020 Ainur. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case clientError
    case serverError
    case noData
}

extension ApiError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .clientError:
            return "Client error!"
        case .serverError:
            return "Server error!"
        case .noData:
            return "No data"
        }
    }
}
