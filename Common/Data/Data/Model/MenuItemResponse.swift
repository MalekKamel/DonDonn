//
// Created by Shaban Kamel on 31/03/2021.
//

import Foundation

public struct MenuItemResponse: Decodable {
    public var id: Int
    public var image: String
    public var title: String
    public var description: String
    public var stars: Int
    public var price: String
}
