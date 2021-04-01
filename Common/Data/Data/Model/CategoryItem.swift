//
// Created by Shaban Kamel on 31/03/2021.
//

import Foundation

public struct CategoryItem: Identifiable {
    public var id: Int
    public var name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
