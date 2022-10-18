//
//  Home.swift
//  Sports.kg
//
//  Created Eldiiar on 4/10/22.
//

struct Home: Codable {
    let next : Int?
    let previous : String?
    let count : Int?
    let page_size : Int?
    let num_pages : Int?
    let results : [HomeResults]?

    enum CodingKeys: String, CodingKey {

        case next = "next"
        case previous = "previous"
        case count = "count"
        case page_size = "page_size"
        case num_pages = "num_pages"
        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        next = try values.decodeIfPresent(Int.self, forKey: .next)
        previous = try values.decodeIfPresent(String.self, forKey: .previous)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        page_size = try values.decodeIfPresent(Int.self, forKey: .page_size)
        num_pages = try values.decodeIfPresent(Int.self, forKey: .num_pages)
        results = try values.decodeIfPresent([HomeResults].self, forKey: .results)
    }
}

struct HomeResults : Codable {
    let id : Int?
    let title : String?
    let price : Int?
    let address : String?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case price = "price"
        case address = "address"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
