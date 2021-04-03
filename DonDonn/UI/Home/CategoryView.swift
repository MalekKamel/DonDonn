//
// Created by Shaban Kamel on 31/03/2021.
//

import SwiftUI

struct CategoryView: View {
    var item: CategoryItem
    var isSelected: Bool

    var body: some View {
        VStack(spacing: 8) {
            Text(item.name)
                    .font(.system(size: 22))
                    .fontWeight(isSelected ? .bold : .none)
                    .foregroundColor(Color(isSelected ? Asset.Assets.mainfont.name : Asset.Assets.subfont.name))

            Capsule()
                    .fill(Color(Asset.Assets.mainfont.name))
                    .frame(width: 30, height: 4)
                    .opacity(isSelected ? 1 : 0)
        }
    }
}
