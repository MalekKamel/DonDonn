//
//  FreshRecipesView.swift
//
//  Created by Shaban kamel on 30/3/21.
//

import SwiftUI
import SDWebImageSwiftUI

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

    private func CartItemView(item: MenuItem) -> some View {
        HStack {
            AnimatedImage(url: URL(string: item.image))
                    .resizable()
                    .frame(width: 60, height: 60)

            Text(item.title)

            Spacer()

            Text(item.price)

            Button(action: {
                print("Round Action")
            }) {
                ZStack(alignment: .center) {
                    Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(UIColor.gray.withAlphaComponent(0.1)))
                            .shadow(radius: 10)

                    Text("x")
                }
            }
                    .padding(.leading, 5)
        }.padding(.bottom)
    }

}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(menuItems: Fake.mealItems)
    }
}
