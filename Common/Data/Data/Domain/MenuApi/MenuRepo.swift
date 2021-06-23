//
// Created by Shaban Kamel on 01/04/2021.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import ModelsMapper
import Combine
import Moya

public class MenuRepo {
    let dataSrc: MenuDataSrc

    public static func build() -> MenuRepo {
        MenuRepo(dataSrc: MenuDataSrc(api: menuApi))
    }

    init(dataSrc: MenuDataSrc) {
        self.dataSrc = dataSrc
    }

    public func promotions() -> AnyPublisher<[PromotionItem], MoyaError> {
        dataSrc.promotions()
                .map { response in
                    ListMapper(PromotionItemMapper()).map(response)
                }.eraseToAnyPublisher()
    }

    public func categories() -> AnyPublisher<[CategoryItem], MoyaError> {
        dataSrc.categories()
                .map { response in
                    ListMapper(CategoryItemMapper()).map(response)
                }.eraseToAnyPublisher()
    }

    public func menu() -> AnyPublisher<[MenuItem], MoyaError> {
        dataSrc.menu()
                .map { response in
                    ListMapper(MenuItemMapper()).map(response)
                }.eraseToAnyPublisher()
    }
}