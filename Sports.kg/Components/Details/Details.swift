//
//  Details.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

struct Details: Codable {
    let id : Int?
    let title : String?
    let text : String?
    let price : Int?
    let address : String?
    let image : String?
    let open_time : String?
    let close_time : String?
    let phone_1 : String?
    let phone_2 : String?
    let whats_app_phone : String?
    let instagram : String?
    let admin : Admin?
    let latitude : Double?
    let type : Type?
    let infrastructure : [Infrastructure]?
    let longitude : Double?
    let galleries : [Galleries]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case text = "text"
        case price = "price"
        case address = "address"
        case image = "image"
        case open_time = "open_time"
        case close_time = "close_time"
        case phone_1 = "phone_1"
        case phone_2 = "phone_2"
        case whats_app_phone = "whats_app_phone"
        case instagram = "instagram"
        case admin = "admin"
        case latitude = "latitude"
        case type = "type"
        case infrastructure = "infrastructure"
        case longitude = "longitude"
        case galleries = "galleries"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        open_time = try values.decodeIfPresent(String.self, forKey: .open_time)
        close_time = try values.decodeIfPresent(String.self, forKey: .close_time)
        phone_1 = try values.decodeIfPresent(String.self, forKey: .phone_1)
        phone_2 = try values.decodeIfPresent(String.self, forKey: .phone_2)
        whats_app_phone = try values.decodeIfPresent(String.self, forKey: .whats_app_phone)
        instagram = try values.decodeIfPresent(String.self, forKey: .instagram)
        admin = try values.decodeIfPresent(Admin.self, forKey: .admin)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        type = try values.decodeIfPresent(Type.self, forKey: .type)
        infrastructure = try values.decodeIfPresent([Infrastructure].self, forKey: .infrastructure)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        galleries = try values.decodeIfPresent([Galleries].self, forKey: .galleries)
    }
}

struct Admin : Codable {
    let id : Int?
    let username : String?
    let email : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case username = "username"
        case email = "email"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        email = try values.decodeIfPresent(String.self, forKey: .email)
    }

}

struct Galleries : Codable {
    let image : String?

    enum CodingKeys: String, CodingKey {

        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}

struct Type : Codable {
    let id : Int?
    let title : String?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}

struct Infrastructure : Codable {
    let id : Int?
    let title : String?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
