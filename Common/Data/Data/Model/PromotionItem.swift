//
// Created by Shaban Kamel on 31/03/2021.
//

import Foundation
import ModelsMapper

public struct PromotionItem: Identifiable {
    public var id: Int
    public var image: String

    public init(id: Int, image: String) {
        self.id = id
        self.image = image
    }
}

class PromotionItemMapper: Mapper {
    typealias I = PromotionItemResponse
    typealias O = PromotionItem

    func map(_ input: PromotionItemResponse) -> PromotionItem {
        PromotionItem(id: input.id, image: input.image)
    }
}