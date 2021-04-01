//
// Created by Shaban Kamel on 01/04/2021.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import RxSwift
import ModelsMapper

public class MoviesRepo {
    let dataSrc: MenuDataSrc

    public static func create() -> MoviesRepo {
        MoviesRepo(dataSrc: MenuDataSrc(api: menuApi))
    }

    init(dataSrc: MenuDataSrc) {
        self.dataSrc = dataSrc
    }

    public func promotions() -> Single<[PromotionItem]> {
        dataSrc.promotions()
                .map { response in
                    ListMapper(PromotionItemMapper()).map(response)
                }
    }

    public func categories() -> Single<[CategoryItem]> {
        dataSrc.categories()
                .map { response in
                    ListMapper(CategoryItemMapper()).map(response)
                }
    }

    public func menu() -> Single<[MenuItem]> {
        dataSrc.menu()
                .map { response in
                    ListMapper(MenuItemMapper()).map(response)
                }
    }
}