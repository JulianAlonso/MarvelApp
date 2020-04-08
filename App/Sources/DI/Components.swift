import Core
import Foundation
import Injection
import MarvelAPI
import Network

// swiftlint:disable line_length
let networkComponent = Component {
    single { HTTPClient(host: Environment.current.host, session: URLSession.shared, authorization: Authorization.apiKey(Environment.current.apiKey)) as HTTPPerforming }
}

let servicesComponent = Component {
    factory { HeroService(client: $0()) as HeroServicing }
}

let useCaseComponent = Component {
    factory { FetchHeroesUseCase(service: $0()) }
}
