import SwiftUI

struct CartRouter {

    func makeCartView(items: [MenuItem]) -> some View {
        CartScreen(presenter: CartPresenterBuilder.build(), menuItems: items)
    }

}