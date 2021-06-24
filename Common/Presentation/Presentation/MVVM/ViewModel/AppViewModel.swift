//
// Created by Apple on 04/04/2021.
//

import SwiftUI
import Data
import Core
import Combine
import Moya

public protocol AppViewModel: ObservableObject, Presentable {
    var requester: CombineRequester { get }
    var state: ScreenState { get set }
    var bag: CancelableBag { get set }
    var dataManager: DataManager { get set }

    func request<T>(_ api: AnyPublisher<T, MoyaError>,
                    options: RequestOptions) -> AnyPublisher<T, Never>
}

// MARK:- Presentable implementation
public extension AppViewModel {

    func showError(error: String) {
        state.error = .error(error)
    }

    func showLoading() {
        state.loading = .loading
    }

    func hideLoading() {
        state.loading = .idle
    }

    func onHandleErrorFailed(error: Error) {
        state.error = .error(error.localizedDescription)
    }
}

public extension AppViewModel {

    func request<T>(_ api: AnyPublisher<T, MoyaError>,
                    options: RequestOptions = RequestOptions.defaultOptions()
    ) -> AnyPublisher<T, Never> {
        state.loading = .loading
        return requester
                .request(api, options: options, presentable: self)
                .subscribe(on: DispatchQueue.global())
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
    }

}
