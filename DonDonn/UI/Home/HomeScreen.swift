//
//  FreshRecipesView.swift
//
//  Created by Shaban kamel on 30/3/21.
//

import SwiftUI

struct HomeScreen: AppScreen {
    @ObservedObject var vm: HomeVM
    @State var selectedMenuItems = [MenuItem]()
    @State public var route: Route? = nil

    func ContentView() -> AnyView {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .trailing) {
                ScrollView(.vertical, showsIndicators: false) {
                    HomeHeader()
                    VStack(alignment: .leading, spacing: 15) {
                        CategoriesListView()
                        MenuListView { item in
                            if let index = selectedMenuItems.firstIndex(of: item) {
                                selectedMenuItems.remove(at: index)
                                return
                            }
                            selectedMenuItems.append(item)
                        }
                    }
                            .padding(.top, 25)
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(20)
                            .offset(y: -35)
                }.background(Color(.white))
            }

            CartButton(selectedMenuItems: $selectedMenuItems) {
                route = .cart
            }.padding()

        }.navigationBarHidden(true).eraseToAnyView()
    }

    func onContentAppear() {
        vm.loadMenuItems()
        vm.loadCategories()
        vm.loadPromotions()
    }

    func NavigationLinks() -> AnyView {
        Group {
            NavigationLink(
                    destination: CartScreen.build(items: selectedMenuItems),
                    tag: .cart,
                    selection: $route) {
                EmptyView()
            }
        }.eraseToAnyView()
    }
}

extension HomeScreen {
    enum Route: AppRoute {
        case cart
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = HomeVM.build()
        HomeScreen(vm: vm).environmentObject(vm)
    }
}
