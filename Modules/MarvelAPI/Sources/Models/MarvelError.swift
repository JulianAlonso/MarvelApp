import Foundation

enum MarvelError: Error, LocalizedError {
    case emptyArraySearchCharacterById
    case unsufficientFields

    var failureReason: String? {
        switch self {
        case .emptyArraySearchCharacterById: return "Response from api without character"
        case .unsufficientFields: return "Trying to parse a character with unssuficient fields"
        }
    }

}
