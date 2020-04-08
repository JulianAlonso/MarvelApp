import Foundation

struct Response<T: Decodable>: Decodable {
    let code: Int
    let status: String
    let data: T
}
