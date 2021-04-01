//
// Created by Shaban Kamel on 31/03/2021.
//

import Foundation
import ModelsMapper

public struct MenuItem: Identifiable, Equatable {
    public var id: Int
    public var image: String
    public var title: String
    public var description: String
    public var stars: Int
    public var price: String

    public init(id: Int,
                image: String,
                title: String,
                description: String,
                stars: Int, price: String) {
        self.id = id
        self.image = image
        self.title = title
        self.description = description
        self.stars = stars
        self.price = price
    }

    public static func ==(lhs: MenuItem, rhs: MenuItem) -> Bool {
        lhs.id == rhs.id
    }
}

class MenuItemMapper: Mapper {
    typealias I = MenuItemResponse
    typealias O = MenuItem

    func map(_ input: MenuItemResponse) -> MenuItem {
        MenuItem(id: input.id,
                image: input.image,
                title: input.title,
                description: input.description,
                stars: input.stars,
                price: input.price)
    }
}