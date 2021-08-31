//
//  TVShow.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import Foundation

struct TvShow: Codable {
    let id: Int
    let averageRuntime: Int
    let dvdCountry: String?
    let externals: External
    let genres: [String]
    let image: Image
    let language: String
    let officialSite: String?
    let premiered: String
    let name: String
    let network: Network?
    let rating: Rating?
    let runtime: Int?
    let schedule: Schedule
    let status: String
    let summary: String
    let type: String
    let updated: Int
    let url: String
    let webChanel: String?
    let weight: Double
    var overview: String {
        get {
            return summary.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        }
    }
}

struct Schedule: Codable {
    let time: String
    let days: [String]
}

struct Rating: Codable {
    let average: Double?
}

struct Network: Codable {
    let id: Int
    let name: String
    let country: Country
}

struct Country: Codable {
    let name: String
    let code: String
    let timeZone: String?
}

struct External: Codable {
    let tvrage: Int?
    let thetvdb: Int?
    let imdb: String?
}

struct Image: Codable {
    let medium: String
    let original: String
}
