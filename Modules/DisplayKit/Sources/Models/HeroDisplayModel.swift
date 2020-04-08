import Foundation

public struct HeroDisplayModel: Identifiable {
    public let id: Int
    public let name: String
    public let description: String?
    public let image: URL

    public init(id: Int, name: String, description: String?, image: URL) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
    }
}
