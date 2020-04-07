//
//  FetchHeroesUseCase.swift
//  Core
//
//  Created by Juli Alonso on 07/04/2020.
//

import Foundation
import Combine

public final class FetchHeroesUseCase: HeroUseCase {
    
    func execute() -> AnyPublisher<[Hero], Error> { service.heroes() }
    
}
