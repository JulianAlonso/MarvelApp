import Foundation

public class HeroUseCase {
    
    let service: HeroServicing
    
    public init(service: HeroServicing) {
        self.service = service
    }
    
}
