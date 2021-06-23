//
// Created by Shaban Kamel on 31/03/2021.
//

import SwiftUI

struct MenuListView: View {
    @EnvironmentObject var vm: HomeVM
    var onItemSelected: (MenuItem) -> Void

    var body: some View {
        LazyVStack(spacing: 10) {
            ForEach(vm.menuItems) { item in
                MenuItemView(item: item, onItemSelected: onItemSelected)
            }
        }
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView { item in
        }
    }
}