import Foundation

struct Feat: Decodable {
    let available: Int?
    let items: [Item]
}

extension Feat {
    struct Item: Decodable {
        let name: String?
    }
}
