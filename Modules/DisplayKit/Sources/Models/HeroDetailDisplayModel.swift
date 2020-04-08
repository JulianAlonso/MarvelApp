import Foundation

public struct HeroDetailDisplayModel: Identifiable {
    public let id: Int
    public let name: String
    public let description: String?
    public let image: URL
    public let series: String
    public let comics: String
    public let stories: String

    public init(id: Int, name: String, description: String?, image: URL, series: String, comics: String, stories: String) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.series = series
        self.comics = comics
        self.stories = stories
    }
}
