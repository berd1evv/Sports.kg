//
//  ClinicRouter.swift
//  MedTech
//
//  Created by Eldiiar on 16/7/22.
//

import Foundation

enum SlidesNetworkRouter: BaseRouter {
    case getSlides

    var path: String {
        switch self {
        case .getSlides:
            return "/api/sliders/"
        }
    }

    var queryParameter: [URLQueryItem]? {
        switch self {
        case .getSlides:
            return nil
        }
    }

    var method: HttpMethod {
        switch self {
        case .getSlides:
            return .GET
        }
    }

    var httpBody: Data? {
        switch self {
        case .getSlides:
            return nil
        }
    }

    var httpHeader: [HttpHeader]? {
        switch self {
        case .getSlides:
            return nil
        }
    }
}
