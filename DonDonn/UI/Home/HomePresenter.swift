//
// Created by Shaban Kamel on 01/04/2021.
//

import Combine

class HomePresenter: AppPresenter {
    @Published public var screenState: ScreenState = .idle
    public var cancellables = Set<AnyCancellable>()

    @Published private(set) var menuItems = [MenuItem]()
    @Published private(set) var categoryItems = [CategoryItem]()
    @Published private(set) var promotions = [PromotionItem]()
    private var interactor: HomeInteractor

    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }

    func loadCategories() {
        request(interactor.categories()) { [weak self] response in
            self?.categoryItems = response
        }
    }

    func loadMenuItems() {
        request(interactor.menu(), updateScreenState: true) { [weak self] response in
            self?.menuItems = response
        }
    }

    func loadPromotions() {
        request(interactor.promotions()) { [weak self] response in
            self?.promotions = response
        }
    }

}

class HomePresenterBuilder {

    static func build() -> HomePresenter {
        let provider = MenuProvider.create()
        let interactor = HomeInteractor(provider: provider)
        return HomePresenter(interactor: interactor)
    }

}