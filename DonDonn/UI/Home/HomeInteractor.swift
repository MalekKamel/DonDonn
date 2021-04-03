//
// Created by Shaban Kamel on 01/04/2021.
//

import Foundation
import Combine
import Moya

class HomeInteractor {
    private let provider: MenuProvider

    init(provider: MenuProvider) {
        self.provider = provider
    }

    func promotions() -> AnyPublisher<[PromotionItem], MoyaError> {
        provider.promotions()
    }

    func categories() -> AnyPublisher<[CategoryItem], MoyaError> {
        provider.categories()
    }

    func menu() -> AnyPublisher<[MenuItem], MoyaError> {
        provider.menu()
    }
}