//
// Created by Apple on 02/04/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItemView: View {
    var item: MenuItem

    var body: some View {
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
            }.padding(.leading, 5)
        }.padding(.bottom)
    }

}

