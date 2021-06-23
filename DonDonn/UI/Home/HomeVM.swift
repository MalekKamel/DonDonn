//
// Created by Shaban Kamel on 01/04/2021.
//

import Combine

class HomeVM: AppViewModel {
    @Published var route: Route? = nil
    public var routePublisher: Published<Route?>.Publisher {
        $route
    }
    public var loadingState: LoadingState = .init()
    public var bag = CancelableBag()

    public var dataManager: DataManager

    @Published private(set) var menuItems = [MenuItem]()
    @Published private(set) var categoryItems = [CategoryItem]()
    @Published private(set) var promotions = [PromotionItem]()

    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }

    func loadCategories() {
        dataManager.menuRepo.categories()
                .catch { _ in
                    Empty<[CategoryItem], Never>()
                }
                .sink(receiveValue: { value in
                    self.categoryItems = value
                })
                .store(in: &bag)
    }

    func loadMenuItems() {
        dataManager.menuRepo.menu()
                .catch { _ in
                    Empty<[MenuItem], Never>()
                }
                .sink(receiveValue: { [weak self] value in
                    self?.menuItems = value
                })
                .store(in: &bag)
    }

    func loadPromotions() {
        dataManager.menuRepo.promotions()
                .catch { _ in
                    Empty<[PromotionItem], Never>()
                }
                .sink(receiveValue: { value in
                    self.promotions = value
                })
                .store(in: &bag)
    }

}

extension HomeVM {
    enum Route: AppRoute {
        case cart
    }
}

extension HomeVM {
    static func build() -> HomeVM {
        HomeVM(dataManager: DataManager.create())
    }
}