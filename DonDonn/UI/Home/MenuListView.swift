//
// Created by Shaban Kamel on 31/03/2021.
//

import SwiftUI

struct MenuListView: View {
    @EnvironmentObject var presenter: HomePresenter

    var body: some View {
        VStack(spacing: 100) {
            ForEach(presenter.menuItems) { data in
                GeometryReader { reader in
                    MenuItemView(item: data)
                            .opacity(1)
                            .onTapGesture {

                            }
                }
                        .frame(height: 250)
                        .simultaneousGesture(DragGesture(minimumDistance: 800)
                                .onChanged({ _ in
                                    print("dragging")
                                }))
            }
        }
                .onAppear(perform: presenter.loadMenuItems)
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView()
    }
}