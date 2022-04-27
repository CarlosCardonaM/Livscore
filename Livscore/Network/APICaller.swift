//
//  APICaller.swift
//  Livscore
//
//  Created by Carlos Cardona on 20/04/22.
//

import Foundation

class APICaller {
    
    static var shared = APICaller()
    
    public func fetchData<T: Codable>(from endpoint: Endpoints, parameters: [URLQueryItem]?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        var url: URL?
        
        switch endpoint {
        case .leagues:
            var urlComp = URLComponents(string: Constants.LEAGUES_STATISTICS_URL)
            urlComp?.queryItems = parameters
            url = urlComp?.url!
        case .teamStatistics:
            var urlComp = URLComponents(string: Constants.TEAM_URL)
            urlComp?.queryItems = parameters
            url = urlComp?.url!
        case .seasons:
            var urlComp = URLComponents(string: Constants.SEASONS_URL)
            urlComp?.queryItems = parameters
            url = urlComp?.url!
        case .countries:
            var urlComp = URLComponents(string: Constants.COUNTRIES_URL)
            urlComp?.queryItems = parameters
            url = urlComp?.url!
        case .timezones:
            var urlComp = URLComponents(string: Constants.TIMEZONES_URL)
            urlComp?.queryItems = parameters
            url = urlComp?.url!
        case .fixtures:
            var urlComp = URLComponents(string: Constants.FIXTURES_URL)
            urlComp?.queryItems = parameters
            url = urlComp?.url!
        case .h2hFixtures:
            var urlComp = URLComponents(string: Constants.FIXTURESH2H_URL)
            urlComp?.queryItems = parameters
            url = urlComp?.url!
        case .trophies:
            var urlComp = URLComponents(string: Constants.TROPHIES_URL)
            urlComp?.queryItems = parameters
            url = urlComp?.url!
        case .playerStatistics:
            var urlComp = URLComponents(string: Constants.PLAYER_STATISTICS_URL)
            urlComp?.queryItems = parameters
            url = urlComp?.url!
        }
        
        guard url != nil else { return }
        
        
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = Headers.HEADERS
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error)
                completion(.failure(error))
                
            } else if let httpResponse = response {
                print("-- Response: \(httpResponse.description)\n")
            }
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(expecting, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
            
        }
        .resume()
    }
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
// BACKUP FUNC
//
//    public func getLeagues(completion: @escaping (Result<LeagueBody, Error>) -> Void) {
//
//        guard var url = URL(string: "https://api-football-v1.p.rapidapi.com/v3/leagues") else {
//            print("Not valid url")
//            return
//        }
//        url.addProperty(name: "name", value: "Premier League")
//        url.addProperty(name: "country", value: "England")
//
//        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            if let error = error {
//                print(error)
//                completion(.failure(error))
//
//            } else if let httpResponse = response {
//                print("-- Response: \(httpResponse)\n")
//            }
//
//            if let data = data {
//                do {
//                    let result = try JSONDecoder().decode(LeagueBody.self, from: data)
//                    completion(.success(result))
//
//                } catch {
//                    print(error)
//                }
//            }
//
//
//        }
//        .resume()
//    }
//}
