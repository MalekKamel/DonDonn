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
                        .bold()
                        .padding(.all, 10)
                Spacer()
            }
                    .padding(.leading, 20)

            HStack {
                Text(item.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.leading, 30)
                Spacer()
            }

            HStack {
                ForEach(0..<item.stars) { item in
                    Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.subheadline)
                }
                Spacer()

                Button(action: {
                    print("Round Action")
                }) {
                    Text(item.price)
                            .font(.subheadline)
                            .bold()
                            .frame(width: 70, height: 40)
                            .background(Color(.black))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                }

            }
                    .padding(.bottom, 30)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(item: Fake.mealItems[0])
    }
}
