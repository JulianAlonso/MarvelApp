import Foundation

struct HeroListResponse: Decodable {
    let page: Page<Hero>

    enum CodingKeys: String, CodingKey {
        case page = "data"
    }
}

// {
//  "code": "int",
//  "status": "string",
//  "copyright": "string",
//  "attributionText": "string",
//  "attributionHTML": "string",
//  "data": {
//    "offset": "int",
//    "limit": "int",
//    "total": "int",
//    "count": "int",
//    "results": [
//      {
//        "id": "int",
//        "name": "string",
//        "description": "string",
//        "modified": "Date",
//        "resourceURI": "string",
//        "urls": [
//          {
//            "type": "string",
//            "url": "string"
//          }
//        ],
//        "thumbnail": {
//          "path": "string",
//          "extension": "string"
//        },
//        "comics": {
//          "available": "int",
//          "returned": "int",
//          "collectionURI": "string",
//          "items": [
//            {
//              "resourceURI": "string",
//              "name": "string"
//            }
//          ]
//        },
//        "stories": {
//          "available": "int",
//          "returned": "int",
//          "collectionURI": "string",
//          "items": [
//            {
//              "resourceURI": "string",
//              "name": "string",
//              "type": "string"
//            }
//          ]
//        },
//        "events": {
//          "available": "int",
//          "returned": "int",
//          "collectionURI": "string",
//          "items": [
//            {
//              "resourceURI": "string",
//              "name": "string"
//            }
//          ]
//        },
//        "series": {
//          "available": "int",
//          "returned": "int",
//          "collectionURI": "string",
//          "items": [
//            {
//              "resourceURI": "string",
//              "name": "string"
//            }
//          ]
//        }
//      }
//    ]
//  },
//  "etag": "string"
// }
