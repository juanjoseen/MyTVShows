//
//  LocalData.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import Foundation

class LocalData {
    static let shared: LocalData = LocalData()
    
    private let defaults: UserDefaults
    
    private let kFavorites: String = "com.myTvShows.Keys.favorites"
    
    private init() {
        defaults = UserDefaults.standard
    }
    
    func saveFavorites(_ list: [TvShow]) -> Bool {
        do {
            let data = try JSONEncoder().encode(list)
            defaults.set(data, forKey: kFavorites)
            return true
        } catch {
            print("Problems saving favorites")
            print(error)
            return false
        }
    }
    
    func getFavorites() -> [TvShow]? {
        if let data = defaults.data(forKey: kFavorites) {
            do {
                let favorites: [TvShow] = try JSONDecoder().decode([TvShow].self, from: data)
                return favorites
            } catch {
                print("problems recovering favorites")
                print(error)
                return nil
            }
        }
        return []
    }
}
