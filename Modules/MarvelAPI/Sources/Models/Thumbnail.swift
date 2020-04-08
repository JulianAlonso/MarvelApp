import Foundation

struct Thumbnail: Decodable {
    let path: String
    let `extension`: String

    enum CodingKeys: String, CodingKey {
        case path
        case `extension` = "extension"
    }
}

extension Thumbnail {
    var url: URL { URL(string: "\(path).\(`extension`)")! }
}
