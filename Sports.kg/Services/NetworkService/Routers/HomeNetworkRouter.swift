//
//  ChangePasswordRouter.swift
//  MedTech
//
//  Created by Eldiiar on 5/7/22.
//

import Foundation

enum HomeNetworkRouter: BaseRouter {
    case getSportAreas
    case getDetails(id: Int)
    case searchSportAreas(search: String)
    case filterSportAreas(type: String, priceMin: String, priceMax: String, infrastructure: String)

    var path: String {
        switch self {
        case .getSportAreas:
            return "/api/sports_areas/"
        case let .getDetails(id):
            return "/api/sports_area/detail/\(id)/"
        case .searchSportAreas:
            return "/api/sports_areas/"
        case .filterSportAreas:
            return "/api/sports_areas/"
        }
    }

    var queryParameter: [URLQueryItem]? {
        switch self {
        case .getSportAreas:
            return nil
        case .getDetails:
            return nil
        case let .searchSportAreas(search):
            return [URLQueryItem(name: "search", value: search)]
        case let .filterSportAreas(type, min, max, infra):
            return [
                URLQueryItem(name: "type", value: type),
                URLQueryItem(name: "price_min", value: min),
                URLQueryItem(name: "price_max", value: max),
                URLQueryItem(name: "infrastructure", value: infra)
            ]
        }
    }

    var method: HttpMethod {
        switch self {
        case .getSportAreas:
            return .GET
        case .getDetails:
            return .GET
        case .searchSportAreas:
            return .GET
        case .filterSportAreas:
            return .GET
        }
    }

    var httpBody: Data? {
        switch self {
        case .getSportAreas:
            return nil
        case .getDetails:
            return nil
        case .searchSportAreas:
            return nil
        case .filterSportAreas:
            return nil
        }
    }

    var httpHeader: [HttpHeader]? {
        switch self {
        case .getSportAreas:
            return nil
        case .getDetails:
            return nil
        case .searchSportAreas:
            return nil
        case .filterSportAreas:
            return nil
        }
    }
}
