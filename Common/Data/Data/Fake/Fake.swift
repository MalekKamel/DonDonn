//
// Created by Shaban Kamel on 31/03/2021.
//

import Foundation

public class Fake {

    public static var mealItems = [
        MenuItem(id: 0,
                image: "https://top10cairo.com/wp-content/uploads/2015/12/best-pizza-pizzas-restaurants-cairo.jpg",
                title: "Papa John’s Pizza",
                description: "KoreanBBQ",
                stars: 5,
                price: "$25",
                expand: false),
        MenuItem(id: 1,
                image: "https://top10cairo.com/wp-content/uploads/2015/12/papa-johns.jpg",
                title: "Lujo’s Fresh Junk",
                description: "Hot Sauce",
                stars: 3,
                price: "$25",
                expand: false),
        MenuItem(id: 2,
                image: "https://top10cairo.com/wp-content/uploads/2015/12/porta-doro.jpg",
                title: "Porta D’oro",
                description: "Best Seller",
                stars: 4,
                price: "$25",
                expand: false),
        MenuItem(id: 3,
                image: "https://top10cairo.com/wp-content/uploads/2015/12/crust.jpg",
                title: "6Crust",
                description: "KoreanBBQ",
                stars: 5,
                price: "$25",
                expand: false),
        MenuItem(id: 4,
                image: "https://top10cairo.com/wp-content/uploads/2015/12/il-mulino.jpg",
                title: "Il Mulino",
                description: "Hot Sauce",
                stars: 3,
                price: "$25",
                expand: false),
        MenuItem(id: 5,
                image: "https://top10cairo.com/wp-content/uploads/2015/12/il-divino.jpg",
                title: "Il Divino Pizzeria",
                description: "dont buy iy",
                stars: 1,
                price: "$25",
                expand: false),
    ]

    public static var categories = [
        CategoryItem(id: 0, name: "Fruits"),
        CategoryItem(id: 1, name: "Vegetables"),
        CategoryItem(id: 2, name: "Dairy"),
        CategoryItem(id: 3, name: "Meat")
    ]

    public static var promotions = [
        PromotionItem(id: 0, image: "discount"),
        PromotionItem(id: 0, image: "discount"),
        PromotionItem(id: 0, image: "discount"),
        PromotionItem(id: 0, image: "discount"),
        PromotionItem(id: 0, image: "discount")
    ]

}
