import Core
import Foundation
import Injection
import MarvelAPI
import Network

let networkComponent = Component {
    single {
        HTTPClient(host: Environment.current.host,
                   session: URLSession.shared,
                   authorization: Authorization(public: Environment.current.public, private: Environment.current.private)) as HTTPPerforming

    }
}

let servicesComponent = Component {
    factory { HeroService(client: $0()) as HeroServicing }
}

let useCaseComponent = Component {
    factory { FetchHeroesUseCase(service: $0()) }
}
