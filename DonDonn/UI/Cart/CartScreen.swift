//
//  FreshRecipesView.swift
//
//  Created by Shaban kamel on 30/3/21.
//

import SwiftUI

struct CartScreen: AppScreen {
    @ObservedObject var presenter: CartPresenter
    var menuItems = [MenuItem]()

    func ContentView() -> AnyView {
        List {
            ForEach(menuItems) { item in
                CartItemView(item: item).removeListSeparator()
            }
        }.background(Color(.white))
                .padding()
        .eraseToAnyView()
    }

}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen(presenter: CartPresenterBuilder.build(), menuItems: Fake.mealItems)
    }
}
