//
// Created by Shaban Kamel on 31/03/2021.
//

import Foundation
import ModelsMapper

public struct CategoryItem: Identifiable {
    public var id: Int
    public var name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

class CategoryItemMapper: Mapper {
    typealias I = CategoryItemResponse
    typealias O = CategoryItem

    func map(_ input: CategoryItemResponse) -> CategoryItem {
        CategoryItem(id: input.id, name: input.name)
    }
}

