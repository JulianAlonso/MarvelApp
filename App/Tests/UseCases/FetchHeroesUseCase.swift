@testable import App
import Combine
@testable import Core
import Foundation
import Injection
import Nimble
import OHHTTPStubs
import XCTest

/// Integration test, only to check the whole thing from network to use case it's working.
final class FetchHeroesUseCaseTests: XCTestCase {

    let path = "/v1/public/characters"
    let useCase = appModule().resolve() as FetchHeroesUseCase
    var bag: Set<AnyCancellable> = []

    override func tearDown() {
        super.tearDown()
        HTTPStubs.removeAllStubs()
    }

    func testFetchSuccess() {
        stubSuccessResponse()

        var herores: [Hero] = []
        useCase.execute().sink(receiveCompletion: {
            switch $0 {
            case .failure(let error): fail("Not expected error: \(error)")
            default: break
            }
        }) { response in
            herores = response
        }.store(in: &bag)

        expect(herores).toEventuallyNot(beEmpty())
    }

}

private extension FetchHeroesUseCaseTests {
    func stubSuccessResponse() {
        stub(condition: isPath(path), fixture: .ok(.heroes))
    }
}
