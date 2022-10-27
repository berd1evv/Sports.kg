//
//  ForgotPassword.swift
//  MedTech
//
//  Created by Eldiiar on 6/7/22.
//

import Foundation

enum ForgotPasswordRouter: BaseRouter {
    case forgotPassword(data: Data)
    case resetPassword(code: String)
    
    var path: String {
        switch self {
        case .forgotPassword:
            return "/auth/users/reset_password/"
        case .resetPassword:
            return "/api/v1/reset_password"
        }
    }

    var queryParameter: [URLQueryItem]? {
        switch self {
        case .forgotPassword:
            return nil
        case let .resetPassword(code):
            return [URLQueryItem(name: "code", value: code)]
        }
    }

    var method: HttpMethod {
        switch self {
        case .forgotPassword:
            return .POST
        case .resetPassword:
            return .POST
        }
    }

    var httpBody: Data? {
        switch self {
        case .forgotPassword:
            return nil
        case .resetPassword:
            return nil
        }
    }

    var httpHeader: [HttpHeader]? {
        switch self {
        case .forgotPassword:
            return nil
        case .resetPassword:
            return nil
        }
    }
}
