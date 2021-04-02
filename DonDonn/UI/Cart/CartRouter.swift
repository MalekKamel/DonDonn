import SwiftUI

struct CartRouter {

    func makeCartView(items: [MenuItem]) -> some View {
        CartView(menuItems: Fake.mealItems)
    }

}