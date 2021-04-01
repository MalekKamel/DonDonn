//
// Created by Shaban Kamel on 31/03/2021.
//

import SwiftUI

struct CategoriesListView: View {
    @State var selectedItem: CategoryItem? = nil
    @EnvironmentObject var presenter: HomePresenter

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 30) {
                ForEach(presenter.categoryItems) { item in
                    CategoryView(item: item, isSelected: item.id == selectedItem?.id)
                            .onTapGesture {
                                withAnimation {
                                    self.selectedItem = item
                                }
                            }
                }
            }
        }
                .onAppear(perform: presenter.loadCategories)
                .padding(.top, 30)
    }
}
