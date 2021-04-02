//
//  FreshRecipesView.swift
//
//  Created by Shaban kamel on 30/3/21.
//

import SwiftUI

struct HomeView: View {
    @State var selectedMenuItems = [MenuItem]()
    @EnvironmentObject var presenter: HomePresenter

    @State private var destination: Destination? = nil

    private enum Destination {
        case cart
    }

    var body: some View {
        switch presenter.state {
        case .idle:
            Color.clear.onAppear(perform: presenter.loadMenuItems)
        case .loading:
            Placeholder()
        case .failed(let error):
            Text(error.localizedDescription)
        case .loaded:
            ContentView()
        }
    }

    private func ContentView() -> some View {
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

            CartButton(selectedMenuItems: selectedMenuItems) {
                self.destination = .cart
            }.padding()

            NavigationLinks()
        }.navigationBarHidden(true)
    }

    private func Placeholder() -> some View {
        ContentView().redacted(reason: .placeholder)
    }

    private func NavigationLinks() -> some View {
        Group {
            NavigationLink(
                    destination: CartRouter().makeCartView(items: selectedMenuItems),
                    tag: .cart, selection: $destination) {
                EmptyView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(HomePresenterBuilder.build())
    }
}
