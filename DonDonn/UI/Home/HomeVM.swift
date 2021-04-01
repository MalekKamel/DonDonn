//
// Created by Shaban Kamel on 01/04/2021.
//

import Combine

class HomeVM: ObservableObject {
    @Published private(set) var menuItems = [MenuItem]()
    @Published private(set) var categoryItems = [CategoryItem]()
    @Published private(set) var promotions = [PromotionItem]()

    func loadCategories() {
        categoryItems = Fake.categories
    }

    func loadMenuItems() {
        menuItems = Fake.mealItems
    }

    func loadPromotions() {
        promotions = Fake.promotions
    }

}
