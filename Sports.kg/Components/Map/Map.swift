//
//  Map.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

struct Map: Codable {
    let id : Int?
    let title : String?
    let price : Int?
    let address : String?
    let image : String?
    let latitude : Double?
    let longitude : Double?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case price = "price"
        case address = "address"
        case image = "image"
        case latitude = "latitude"
        case longitude = "longitude"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
    }
}
