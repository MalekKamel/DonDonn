//
// Created by Shaban Kamel on 31/03/2021.
//

import Foundation

public struct MenuItem: Identifiable {
    public var id: Int
    public var image: String
    public var title: String
    public var description: String
    public var stars: Int
    public var price: String
    public var expand: Bool

    public init(id: Int,
                image: String,
                title: String,
                description: String,
                stars: Int, price: String,
                expand: Bool) {
        self.id = id
        self.image = image
        self.title = title
        self.description = description
        self.stars = stars
        self.price = price
        self.expand = expand
    }
}
