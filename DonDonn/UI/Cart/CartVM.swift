//
// Created by Shaban Kamel on 01/04/2021.
//

import Combine

class CartVM: AppViewModel {
    @Published var route: Route? = nil
    public var routePublisher: Published<Route?>.Publisher {
        $route
    }
    public var loadingState: LoadingState = .init()
    public var bag = CancelableBag()

    public var dataManager: DataManager

    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }

}

extension CartVM {
    enum Route: AppRoute {
    }
}

extension CartVM {
    static func build() -> CartVM {
        CartVM(dataManager: DataManager.create())
    }
}