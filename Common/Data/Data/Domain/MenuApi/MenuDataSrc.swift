//
// Created by Shaban Kamel on 01/04/2021.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import Combine
import Moya

class MenuDataSrc {
    let api: MoyaProvider<MenuApi>

    init(api: MoyaProvider<MenuApi>) {
        self.api = api
    }

    func promotions() -> AnyPublisher<[PromotionItemResponse], MoyaError> {
        api.requestPublisher(.promotions).map([PromotionItemResponse].self, failsOnEmptyData: false)
    }

    func categories() -> AnyPublisher<[CategoryItemResponse], MoyaError> {
        api.requestPublisher(.categories).map([CategoryItemResponse].self, failsOnEmptyData: false)
    }

        func menu() -> AnyPublisher<[MenuItemResponse], MoyaError> {
        api.requestPublisher(.menu).map([MenuItemResponse].self, failsOnEmptyData: false)
    }

}