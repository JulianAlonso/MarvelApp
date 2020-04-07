import Foundation

struct Hero: Decodable {
    let id: Int?
    let name: String?
    let description: String?
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
