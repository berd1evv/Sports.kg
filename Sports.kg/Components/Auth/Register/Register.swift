//
//  Register.swift
//  Sports.kg
//
//  Created Eldiiar on 18/10/22.
//

struct Register: Codable {
    let email : String?
    let username : String?
    let id : Int?

    enum CodingKeys: String, CodingKey {

        case email = "email"
        case username = "username"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
    }
}
