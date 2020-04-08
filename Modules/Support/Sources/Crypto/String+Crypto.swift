import Foundation

public extension String {
    var md5: String { hashed(.md5)! }
}
