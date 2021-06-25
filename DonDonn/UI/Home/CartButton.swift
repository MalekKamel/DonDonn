//
// Created by Apple on 02/04/2021.
//

import SwiftUI

struct CartButton: View {
    @Binding var selectedMenuItems: [MenuItem]
    let action: () -> Void

    var body: some View {
        Button(action: {
//            if selectedMenuItems.isEmpty {
//                return
//            }
            action()
        }) {
            ZStack(alignment: .center) {
                Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                Image(Asset.Assets.shoppingCart.name)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fill)

                if !selectedMenuItems.isEmpty {
                    OrderNoBadgeView().offset(x: 15, y: -15)
                }
            }
        }
    }

    private func OrderNoBadgeView() -> some View {
        ZStack {
            Circle()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.green)
                    .shadow(radius: 10)
            Text("\(selectedMenuItems.count)")
                    .foregroundColor(.white)
        }
    }
}
