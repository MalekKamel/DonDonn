//
// Created by Shaban Kamel on 01/04/2021.
//

import Combine

class HomePresenter: AppPresenter {
    @Published public var state: ScreenState = .idle

    @Published private(set) var menuItems = [MenuItem]()
    @Published private(set) var categoryItems = [CategoryItem]()
    @Published private(set) var promotions = [PromotionItem]()
    private var cancellables = Set<AnyCancellable>()
    private var interactor: HomeInteractor

    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }

    func loadCategories() {
        interactor.categories()
                .catch { error -> Empty<[CategoryItem], Never> in
                    self.state = .failed(error)
                    return Empty<[CategoryItem], Never>()
                }
                .sink(receiveValue: { value in
                    self.categoryItems = value
                })
                .store(in: &cancellables)
    }

    func loadMenuItems() {
        state = .loading
        interactor.menu()
                .catch { error -> Empty<[MenuItem], Never> in
                    self.state = .failed(error)
                    return Empty<[MenuItem], Never>()
                }
                .sink(receiveValue: { [weak self] value in
                    self?.menuItems = value
                    self?.state = .loaded
                })
                .store(in: &cancellables)
    }

    func loadPromotions() {
        interactor.promotions()
                .catch { error -> Empty<[PromotionItem], Never> in
                    self.state = .failed(error)
                    return Empty<[PromotionItem], Never>()
                }
                .sink(receiveValue: { value in
                    self.promotions = value
                })
                .store(in: &cancellables)
    }

}

class HomePresenterBuilder {

    static func build() -> HomePresenter {
        let provider = MenuProvider.create()
        let interactor = HomeInteractor(provider: provider)
        return HomePresenter(interactor: interactor)
    }

}