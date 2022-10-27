//
//  Login.swift
//  Sports.kg
//
//  Created Eldiiar on 18/10/22.
//

struct Login: Codable {
    let refresh : String?
    let access : String?

    enum CodingKeys: String, CodingKey {

        case refresh = "refresh"
        case access = "access"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        refresh = try values.decodeIfPresent(String.self, forKey: .refresh)
        access = try values.decodeIfPresent(String.self, forKey: .access)
    }
}
