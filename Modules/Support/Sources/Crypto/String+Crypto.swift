import Foundation
import CryptoKit

public extension String {
    var md5: String {
        Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data()).map { String(format: "%02hhx", $0) }.joined()
    }
}
