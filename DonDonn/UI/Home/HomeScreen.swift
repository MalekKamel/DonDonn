//
//  FreshRecipesView.swift
//
//  Created by Shaban kamel on 30/3/21.
//

import SwiftUI

struct HomeScreen: AppScreen {
    @ObservedObject var presenter: HomePresenter
    @State var selectedMenuItems = [MenuItem]()
    @State private var destination: Destination? = nil

    private enum Destination {
        case cart
    }

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
                self.destination = .cart
            }.padding()

            NavigationLinks()
        }.navigationBarHidden(true).eraseToAnyView()
    }

    func onInitialViewAppear() {
        presenter.loadMenuItems()
    }

    func LoadingView() -> AnyView {
        ContentView().redacted(reason: .placeholder).eraseToAnyView()
    }

    private func NavigationLinks() -> some View {
        Group {
            NavigationLink(
                    destination: CartRouter().makeCartView(items: selectedMenuItems),
                    tag: .cart,
                    selection: $destination) {
                EmptyView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(presenter: HomePresenterBuilder.build()).environmentObject(HomePresenterBuilder.build())
    }
}
