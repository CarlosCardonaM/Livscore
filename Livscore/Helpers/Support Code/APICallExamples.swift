//
//  APICallExamples.swift
//  Livscore
//
//  Created by Carlos Cardona on 27/04/22.
//

import Foundation

//        APICaller.shared.fetchData(from: .playerStatistics,
//                                   parameters: [URLQueryItem(name: "id", value: "276"),
//                                                URLQueryItem(name: "season", value: "2020")],
//                                   expecting: PlayerStatisticsBody.self) { result in
//            switch result {
//            case .success(let response):
//
//                print(response.response[0].player.firstname)
//                print(response.response[0].player.lastname)
//
//                for x in response.response[0].statistics {
//                    print("League: \(x.league.name)")
//                    print("Goals: \(x.goals.total ?? 10000)")
//                    print("Games: \(x.games.appearences)")
//                    print("Season: \(x.league.season)")
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
        
//        APICaller.shared.fetchData(from: .trophies, parameters: [URLQueryItem(name: "player", value: "276")], expecting: TrophiesBody.self) { result in
//            switch result {
//            case .success(let trophies):
//                for x in trophies.response {
//                    print(x.league)
//                    print(x.season)
//                    print(x.place)
//                    print("-------------")
//                    print(" ")
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//        APICaller.shared.fetchData(from: .teamStatistics,
//                                   parameters: [URLQueryItem(name: "team", value: "40"),
//                                                URLQueryItem(name: "season", value: "2019"),
//                                                URLQueryItem(name: "league", value: "39")],
//                                   expecting: TeamBody.self) { result in
//            switch result {
//            case .success(let response):
//                print(response.response.team.name)
//            case .failure(let error):
//                print(error)
//            }
//        }
//        APICaller.shared.fetchData(from: .timezones,
//                                   parameters: nil,
//                                   expecting: Timezone.self) { result in
//                                       switch result {
//                                       case .success(let timezones):
//                                           for x in timezones.timezones {
//                                               print(x)
//                                           }
//                                       case .failure(let error):
//                                           print(error)
//                                       }
//                                   }
        
//        APICaller.shared.fetchData(from: .fixtures, parameters: [
//            URLQueryItem(name: "league", value: "39"),
//            URLQueryItem(name: "season", value: "2021")
//        ], expecting: FixturesBody.self) { result in
//            switch result {
//            case .success(let response):
//                for x in response.allFixtures {
//                    print("""
//-----
//ID: \(x.fixture.id)
//LEAGUE: \(x.league.name)
//FIXTURE: \(x.teams.home.name) vs \(x.teams.away.name)
//SCORE: Home - \(x.score.fulltime.home ?? 1000) Away - \(x.score.fulltime.away ?? 1000)
//""")
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
        
//        APICaller.shared.fetchData(from: .h2hFixtures, parameters: [URLQueryItem(name: "h2h", value: "33-34")], expecting: FixturesBody.self) { result in
//            switch result {
//            case .success(let response):
//                print("PAST FIXTURES:")
//                for x in response.allFixtures {
//                    print(
//"""
//
//DATE: \(x.fixture.date)
//\(x.teams.home.name): \(x.score.fulltime.home ?? 0000) - \(x.score.fulltime.away ?? 0000) :\(x.teams.away.name)
//
//
//"""
//                    )
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
        
//        APICaller.shared.fetchData(from: .fixtureStatistics, parameters: [URLQueryItem(name: "fixture", value: "710871")], expecting: FixtureStatitics.self) { result in
//            switch result {
//            case .success(let response):
//                print("FIXRURE: \(response.response[0].team.name) Vs \(response.response[1].team.name)")
//                for x in response.response[0].statistics {
//                    print("\(x.type): \(String(describing: x.value))")
//                }
//                print("--------------")
//                for y in response.response[1].statistics {
//                    print("\(y.type): \(String(describing: y.value))")
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
