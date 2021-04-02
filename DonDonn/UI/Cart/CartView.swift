//
//  FreshRecipesView.swift
//
//  Created by Shaban kamel on 30/3/21.
//

import SwiftUI

struct CartView: View {
    var menuItems = [MenuItem]()

    var body: some View {
        List {
            ForEach(menuItems) { item in
                CartItemView(item: item).removeListSeparator()
            }
        }.background(Color(.white))
                .padding()
    }

}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(menuItems: Fake.mealItems)
    }
}
