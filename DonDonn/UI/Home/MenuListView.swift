//
// Created by Shaban Kamel on 31/03/2021.
//

import SwiftUI

struct MenuListView: View {
    @EnvironmentObject var presenter: HomePresenter
    var onItemSelected: (MenuItem) -> Void

    var body: some View {
        LazyVStack(spacing: 10) {
            ForEach(presenter.menuItems) { item in
                MenuItemView(item: item, onItemSelected: onItemSelected)
            }
        }.onAppear(perform: presenter.loadMenuItems)
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView { item in
        }
    }
}