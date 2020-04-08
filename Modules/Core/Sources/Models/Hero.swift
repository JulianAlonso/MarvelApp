import Foundation

public struct Hero: Identifiable {
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

// {
//    "id": "int",
//    "name": "string",
//    "description": "string",
//    "modified": "Date",
//    "resourceURI": "string",
//    "urls": [
//      {
//        "type": "string",
//        "url": "string"
//      }
//    ],
//    "thumbnail": {
//      "path": "string",
//      "extension": "string"
//    },
//    "comics": {
//      "available": "int",
//      "returned": "int",
//      "collectionURI": "string",
//      "items": [
//        {
//          "resourceURI": "string",
//          "name": "string"
//        }
//      ]
//    },
//    "stories": {
//      "available": "int",
//      "returned": "int",
//      "collectionURI": "string",
//      "items": [
//        {
//          "resourceURI": "string",
//          "name": "string",
//          "type": "string"
//        }
//      ]
//    },
//    "events": {
//      "available": "int",
//      "returned": "int",
//      "collectionURI": "string",
//      "items": [
//        {
//          "resourceURI": "string",
//          "name": "string"
//        }
//      ]
//    },
//    "series": {
//      "available": "int",
//      "returned": "int",
//      "collectionURI": "string",
//      "items": [
//        {
//          "resourceURI": "string",
//          "name": "string"
//        }
//      ]
//    }
//  }
// ]
