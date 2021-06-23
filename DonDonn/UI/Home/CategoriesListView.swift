//
// Created by Shaban Kamel on 31/03/2021.
//

import SwiftUI

struct CategoriesListView: View {
    @State var selectedItem: CategoryItem? = nil
    @EnvironmentObject var vm: HomeVM

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 30) {
                ForEach(vm.categoryItems) { item in
                    CategoryView(item: item, isSelected: item.id == selectedItem?.id)
                            .onTapGesture {
                                withAnimation {
                                    self.selectedItem = item
                                }
                            }
                            .onAppear {
                                // select first item by default
                                if selectedItem != nil {
                                    return
                                }
                                selectedItem = vm.categoryItems.first
                            }
                }
            }
        }
                .onAppear(perform: vm.loadCategories)
                .padding(.top, 30)
    }
}
