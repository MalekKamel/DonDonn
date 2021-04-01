//
// Created by Shaban Kamel on 01/04/2021.
//

import Foundation
import Combine
import RxCombine

class HomeInteractor {
    private let provider: MenuProvider

    init(provider: MenuProvider) {
        self.provider = provider
    }

    func promotions() -> AnyPublisher<[PromotionItem], Swift.Error> {
        provider.promotions().publisher
    }

    func categories() -> AnyPublisher<[CategoryItem], Swift.Error> {
        provider.categories().publisher
    }

    func menu() -> AnyPublisher<[MenuItem], Swift.Error> {
        provider.menu().publisher
    }
}