import Foundation

struct Hero: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: Thumbnail?
    let comics: Feat
    let stories: Feat
    let series: Feat
}
