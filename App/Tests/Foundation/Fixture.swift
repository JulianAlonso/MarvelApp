import Foundation
import OHHTTPStubs
import XCTest

enum Fixture {
    case ok(Response)

    var filename: Path {
        switch self {
        case .ok(let response): return response.path
        }
    }

    var status: Int32 {
        switch self {
        case .ok: return 200
        }
    }

    var filepath: String {
        return filename.resource
    }

    var contentType: [String: String] {
        return ["Content-Type": "application/json"]
    }
}

@discardableResult
func stub(condition: @escaping HTTPStubsTestBlock, fixture type: Fixture) -> HTTPStubsDescriptor {
    return stub(condition: condition) { _ -> HTTPStubsResponse in
        fixture(filePath: type.filepath, status: type.status, headers: type.contentType)
    }
}

@discardableResult
func stub(condition: @escaping HTTPStubsTestBlock,
          count: @escaping () -> Int,
          called: @escaping () -> Void,
          first: Fixture,
          second: Fixture) -> HTTPStubsDescriptor {
    return stub(condition: condition) { _ -> HTTPStubsResponse in
        defer { called() }
        if count() <= 1 {
            return fixture(filePath: first.filepath, status: first.status, headers: first.contentType)
        } else {
            return fixture(filePath: second.filepath, status: second.status, headers: second.contentType)
        }
    }
}
