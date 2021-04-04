//
// Created by Shaban Kamel on 01/04/2021.
//

import Combine

class CartPresenter: AppPresenterProtocol {
    @Published public var state: ScreenState = .idle
    private var interactor: CartInteractor
    public var cancellables = Set<AnyCancellable>()

    init(interactor: CartInteractor) {
        self.interactor = interactor
    }

}

class CartPresenterBuilder {

    static func build() -> CartPresenter {
        let provider = MenuProvider.create()
        let interactor = CartInteractor(provider: provider)
        return CartPresenter(interactor: interactor)
    }

}