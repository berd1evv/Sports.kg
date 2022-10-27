//
//  ProfileRouter.swift
//  MedTech
//
//  Created by Eldiiar on 16/7/22.
//

import Foundation

enum ProfileeRouter: BaseRouter {
    case getUser
    case addImage(id: Int, image: Data, boundary: String)
    case changeImage(id: Int, image: Data, boundary: String)
    case changeAddressAndPhone(id: Int, data: Data)

    var path: String {
        switch self {
        case .getUser:
            return "/auth/users/me/"
        case let .addImage(id, _, _):
            return "/api/v1/patients/img/\(id)"
        case let .changeImage(id, _, _):
            return "/api/v1/patients/img/\(id)"
        case let .changeAddressAndPhone(id, _):
            return "/api/v1/patients/edit/\(id)"
        }
    }

    var queryParameter: [URLQueryItem]? {
        switch self {
        case .getUser:
            return nil
        case .addImage:
            return nil
        case .changeImage:
            return nil
        case .changeAddressAndPhone:
            return nil
        }
    }

    var method: HttpMethod {
        switch self {
        case .getUser:
            return .GET
        case .addImage:
            return .POST
        case .changeImage:
            return .PUT
        case .changeAddressAndPhone:
            return .PUT
        }
    }

    var httpBody: Data? {
        switch self {
        case .getUser:
            return nil
        case let .addImage(_, image, _):
            return image
        case let .changeImage(_, image, _):
            return image
        case let .changeAddressAndPhone(_ , data):
            return data
        }
    }

    var httpHeader: [HttpHeader]? {
        switch self {
        case .getUser:
            return nil
        case let .addImage(_, _, boundary):
            return [HttpHeader(field: "Content-Type", value: "multipart/form-data; boundary=\(boundary)")]
        case let .changeImage(_, _, boundary):
            return [HttpHeader(field: "Content-Type", value: "multipart/form-data; boundary=\(boundary)")]
        case .changeAddressAndPhone:
            return nil
        }
    }
}
