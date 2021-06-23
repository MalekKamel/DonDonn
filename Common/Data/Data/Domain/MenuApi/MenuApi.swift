//
// Created by Shaban Kamel on 01/04/2021.
// Copyright (c) 2020 sha. All rights reserved.
//

import Foundation
import Moya

let menuApi: MoyaProvider<MenuApi> = createProvider()

enum MenuApi {
    case promotions
    case categories
    case menu
}

extension MenuApi: TargetType {
    public var baseURL: URL {
        URL(string: "https://github.com/ShabanKamell/DonDonn")!
    }

    public var path: String {
        switch self {
        case .promotions:
            return "/promotions"
        case .categories:
            return "/categories"
        case .menu:
            return "/menu"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .promotions,
             .categories,
             .menu:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .promotions:
            let params: [String: Any] = ["query": ""]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)

        case .categories:
            let params: [String: Any] = ["query": ""]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .menu:
            let params: [String: Any] = ["query": ""]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }

    public var validationType: ValidationType {
        .none
    }

    public var sampleData: Data {
        switch self {
        case .promotions:
            let json = "[{\"id\":1,\"image\":\"https://github.com/ShabanKamell/DonDonn/blob/master/blob/discount2.png?raw=true\"},{\"id\":2,\"image\":\"https://github.com/ShabanKamell/DonDonn/blob/master/blob/discount2.png?raw=true\"},{\"id\":3,\"image\":\"https://github.com/ShabanKamell/DonDonn/blob/master/blob/discount2.png?raw=true\"},{\"id\":4,\"image\":\"https://github.com/ShabanKamell/DonDonn/blob/master/blob/discount2.png?raw=true\"},{\"id\":5,\"image\":\"https://github.com/ShabanKamell/DonDonn/blob/master/blob/discount2.png?raw=true\"},{\"id\":6,\"image\":\"https://github.com/ShabanKamell/DonDonn/blob/master/blob/discount2.png?raw=true\"}]"
            return json.data(using: .utf8)!

        case .categories:
            let json = "[{\"id\":1,\"name\":\"Fruits\"},{\"id\":2,\"name\":\"Vegetables\"},{\"id\":3,\"name\":\"Dairy\"},{\"id\":4,\"name\":\"Meat\"}]"
            return json.data(using: .utf8)!

        case .menu:
            let json = "[{\"id\":1,\"image\":\"https://github.com/ShabanKamell/DonDonn/blob/master/blob/pizza/pizza1.jpeg?raw=true\",\"title\":\"Papa John’s Pizza\",\"description\":\"\",\"stars\":5,\"price\":\"25 USD\"},{\"id\":2,\"image\":\"https://github.com/ShabanKamell/DonDonn/blob/master/blob/pizza/pizza2.jpeg?raw=true\",\"title\":\"Lujo’s Fresh Junk\",\"description\":\"\",\"stars\":5,\"price\":\"25 USD\"},{\"id\":3,\"image\":\"https://github.com/ShabanKamell/DonDonn/blob/master/blob/pizza/pizza3.jpeg?raw=true\",\"title\":\"Porta D’oro\",\"description\":\"\",\"stars\":5,\"price\":\"25 USD\"},{\"id\":4,\"image\":\"https://github.com/ShabanKamell/DonDonn/blob/master/blob/pizza/pizza4.jpeg?raw=true\",\"title\":\"6Crust\",\"description\":\"\",\"stars\":5,\"price\":\"25 USD\"},{\"id\":5,\"image\":\"https://github.com/ShabanKamell/DonDonn/blob/master/blob/pizza/pizza5.jpeg?raw=true\",\"title\":\"Il Mulino\",\"description\":\"\",\"stars\":5,\"price\":\"25 USD\"},{\"id\":6,\"image\":\"https://github.com/ShabanKamell/DonDonn/blob/master/blob/pizza/pizza6.jpeg?raw=true\",\"title\":\"Il Divino Pizzeria\",\"description\":\"\",\"stars\":5,\"price\":\"25 USD\"}]"
            return json.data(using: .utf8)!
        }
    }

    public var headers: [String: String]? {
        ["Authorization": "Bearer \("TOKEN")"]
    }

    var parameters: [String: Any]? {
        nil
    }

}

