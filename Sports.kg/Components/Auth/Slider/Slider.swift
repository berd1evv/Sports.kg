//
//  Slider.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

struct Slider: Codable {
    let id : Int?
    let title : String?
    let text : String?
    let image : String?
    let numeration : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case text = "text"
        case image = "image"
        case numeration = "numeration"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        numeration = try values.decodeIfPresent(Int.self, forKey: .numeration)
    }

}
