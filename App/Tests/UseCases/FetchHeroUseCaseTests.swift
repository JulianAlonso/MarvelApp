@testable import App
import Combine
@testable import Core
import Foundation
import Injection
@testable import MarvelAPI
import Nimble
import OHHTTPStubs
import XCTest

/// Integration test, only to check the whole thing from network to use case it's working.
final class FetchHeroDetailUseCaseTests: XCTestCase {

    let id = 99
    lazy var path: String = { "/v1/public/characters/\(id)" }()
    let useCase = appModule().resolve() as FetchHeroDetailUseCase
    var bag: Set<AnyCancellable> = []

    override func tearDown() {
        super.tearDown()
        HTTPStubs.removeAllStubs()
    }

    func testFetchHeroSuccess() {
        stubSuccessResponse()

        var hero: Core.Hero?
        useCase.execute(.init(id: id)).sink(receiveCompletion: {
            switch $0 {
            case .failure(let error): fail("Not expected error: \(error)")
            default: break
            }
        }) { response in
            hero = response
        }.store(in: &bag)

        expect(hero).toEventuallyNot(beNil())
    }

    func testFetchHeroItsEmpty() {
        stubFailingResponse()

        var error: Error?
        useCase.execute(.init(id: id)).sink(receiveCompletion: {
            switch $0 {
            case .failure(let err): error = err
            default: break
            }
        }) { response in
            fail("Not expected response: \(response)")
        }.store(in: &bag)

        expect(error).toEventually(matchError(MarvelError.emptyArraySearchCharacterById))
    }

}

private extension FetchHeroDetailUseCaseTests {
    func stubSuccessResponse() {
        stub(condition: isPath(path), fixture: .ok(.heroDetail))
    }

    func stubFailingResponse() {
        stub(condition: isPath(path), fixture: .ok(.emptyHero))
    }
}
