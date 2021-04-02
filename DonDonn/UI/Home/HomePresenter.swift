//
// Created by Shaban Kamel on 01/04/2021.
//

import Combine

class HomePresenter: ObservableObject {
    @Published private(set) var menuItems = [MenuItem]()
    @Published private(set) var categoryItems = [CategoryItem]()
    @Published private(set) var promotions = [PromotionItem]()
    private var cancellables = Set<AnyCancellable>()
    @Published private(set) var state: LoadingState<[MenuItem]> = .idle

    private var interactor: HomeInteractor

    init(interactor: HomeInteractor) {
        self.interactor = interactor
    }

    func loadCategories() {
        interactor.categories()
                .catch { _ in
                    Empty<[CategoryItem], Never>()
                }
                .sink(receiveValue: { value in
                    self.categoryItems = value
                })
                .store(in: &cancellables)
    }

    func loadMenuItems() {
        state = .loading
        interactor.menu()
                .catch { _ in
                    Empty<[MenuItem], Never>()
                }
                .sink(receiveValue: { [weak self] value in
                    self?.menuItems = value
                    self?.state = .loaded(value)
                })
                .store(in: &cancellables)
    }

    func loadPromotions() {
        interactor.promotions()
                .catch { _ in
                    Empty<[PromotionItem], Never>()
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