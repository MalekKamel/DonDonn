//
// Created by Shaban Kamel on 01/04/2021.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class MenuDataSrc {
    let api: MoyaProvider<MenuApi>

    init(api: MoyaProvider<MenuApi>) {
        self.api = api
    }

    func promotions() -> Single<[PromotionItemResponse]> {
        api.rx.request(.promotions).mapItem()
    }

    func categories() -> Single<[CategoryItemResponse]> {
        api.rx.request(.categories).mapItem()
    }

    func menu() -> Single<[MenuItemResponse]> {
        api.rx.request(.menu).mapItem()
    }

}