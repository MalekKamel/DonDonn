//
//  OurPicks.swift
//  DonDonn
//
//  Created by Shaban Kamel on 31/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct MenuItemView: View {
    @State var item: MenuItem
    @State var isSelected: Bool = false
    var onItemSelected: (MenuItem) -> Void

    var body: some View {
        VStack {
            ZStack {
                AnimatedImage(url: URL(string: item.image))
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.9,
                                height: UIScreen.main.bounds.height * 0.25)
                        .cornerRadius(20)
                        .shadow(radius: 10)
            }.edgesIgnoringSafeArea(.top)

            HStack {
                Text(item.title)
                        .foregroundColor(.black)
                        .bold()
                        .padding(.all, 10)
                Spacer()
            }
                    .padding(.leading, 20)

            HStack {
                ForEach(0..<item.stars) { item in
                    Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.subheadline)
                }
                Spacer()

                Button(action: {
                    isSelected = !isSelected
                    onItemSelected(item)
                }) {
                    Text(item.price)
                            .font(.subheadline)
                            .bold()
                            .frame(width: 70, height: 40)
                            .background(isSelected ? Color(.green) : Color(.black))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                }

            }
                    .padding(.bottom, 30)
                    .padding(.leading, 10)
                    .padding(.trailing, 20)
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(item: Fake.mealItems[0]) { item in
        }
    }
}
