//
// Created by Shaban Kamel on 01/04/2021.
//

import Combine

class CartVM: AppViewModel {
    @Published public var route: RouteState<Route> = .init()
    @Published public var state: ScreenState = .init()
    public var bag = CancelableBag()
    public var dataManager: DataManager
    public var requester: CombineRequestHandler

    init(dataManager: DataManager, requester: CombineRequestHandler) {
        self.dataManager = dataManager
        self.requester = requester
    }

}

extension CartVM {
    enum Route: AppRoute {
    }
}

extension CartVM {
    static func build() -> CartVM {
        CartVM(dataManager: DataManager.create(), requester: CombineRequestHandler())
    }
}