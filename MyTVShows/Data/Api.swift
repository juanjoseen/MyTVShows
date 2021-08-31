//
//  Api.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import Foundation

enum ApiError: Error {
    case NoData
    case BadResponse
}

class Api {
    public static let shared: Api = Api()
    
    private init() {}
    
    func getAllShows(completion: @escaping ([TvShow], Error?) -> Void) {
        let urlSession: URLSession = URLSession.shared
        let url: URL = URL(string: "https://api.tvmaze.com/shows")!
        urlSession.dataTask(with: url) { result in
            switch result {
            case .success(let (response, data)):
                do {
                    if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                        let result: [TvShow] = try JSONDecoder().decode([TvShow].self, from: data)
                        completion(result, nil)
                    } else {
                        completion([], ApiError.BadResponse)
                    }
                } catch {
                    print(error)
                    completion([], error)
                }
            case .failure(let error):
                print(error)
                completion([], error)
            }
        }.resume()
    }
}

extension URLSession {
    
    func dataTask(with url:URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
