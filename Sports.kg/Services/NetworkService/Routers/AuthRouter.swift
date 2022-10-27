//
//  SignInRouter.swift
//  MedTech
//
//  Created by Eldiiar on 5/7/22.
//

import Foundation

enum AuthRouter: BaseRouterLogin {
    case signIn(data: Data)
    case logout(data: Data)
    case refreshToken(data: Data)
    case register(data: Data)
    
    var path: String {
        switch self {
        case .signIn:
            return "/auth/jwt/create/"
        case .logout:
            return "/api/auth/logout"
        case .refreshToken:
            return "/auth/jwt/refresh/"
        case .register:
            return "/auth/users/"
        }
    }
    
    var queryParameter: [URLQueryItem]? {
        switch self {
        case .signIn:
            return nil
        case .logout:
            return nil
        case .refreshToken:
            return nil
        case .register:
            return nil
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .signIn:
            return .POST
        case .logout:
            return .POST
        case .refreshToken:
            return .POST
        case .register:
            return .POST
        }
    }
    
    var httpBody: Data? {
        switch self {
        case let .signIn(data):
            return data
        case let .logout(data):
            return data
        case let .refreshToken(data):
            return data
        case let .register(data):
            return data
        }
    }
    
    var httpHeader: [HttpHeader]? {
        switch self {
        case .signIn:
            return nil
        case .logout:
            return nil
        case .refreshToken:
            return nil
        case .register:
            return nil
        }
    }
}
