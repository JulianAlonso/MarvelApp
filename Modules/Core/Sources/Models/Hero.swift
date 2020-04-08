import Foundation

public struct Hero: Identifiable {
    public let id: Int
    public let name: String
    public let description: String?
    public let image: URL
    public let comics: [String]
    public let stories: [String]
    public let series: [String]

    public init(id: Int,
                name: String,
                description: String?,
                image: URL,
                comics: [String],
                stories: [String],
                series: [String]) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.comics = comics
        self.stories = stories
        self.series = series
    }
}
