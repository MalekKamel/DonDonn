//
// Created by Shaban Kamel on 01/04/2021.
//

import Combine

class CartVM: AppViewModel {
    @Published public var route: RouteState<Route> = .init()
    @Published public var loadState: LoadingState = .init()
    @Published public var errorState: ErrorState = .init()
    public var bag = CancelableBag()
    public var dataManager: DataManager
    public var requester: CombineRequester

    init(dataManager: DataManager, requester: CombineRequester) {
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
        CartVM(dataManager: DataManager.create(), requester: CombineRequester())
    }
}