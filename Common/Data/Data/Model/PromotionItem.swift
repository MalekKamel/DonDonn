//
// Created by Shaban Kamel on 31/03/2021.
//

import Foundation

public struct PromotionItem: Identifiable {
    public var id: Int
    public var image: String

    public init(id: Int, image: String) {
        self.id = id
        self.image = image
    }
}