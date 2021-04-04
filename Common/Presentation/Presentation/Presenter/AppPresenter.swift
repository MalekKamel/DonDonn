//
// Created by Apple on 04/04/2021.
//

import SwiftUI
import Combine
import Data

public protocol AppPresenter: ObservableObject {
    var screenState: ScreenState { get set }
    var cancellables: Set<AnyCancellable> { get set }
}

public extension AppPresenter {

    func request<T>(_ api: AnyPublisher<T, Swift.Error>,
                    onError: ((Swift.Error) -> Void)? = nil,
                    completion: @escaping (T) -> Void) {
        api.catch { error -> Empty<T, Never> in
                    onError?(error)
                    return Empty<T, Never>()
                }
                .sink(receiveValue: { [weak self] value in
                    completion(value)
                    self?.screenState = .loaded
                })
                .store(in: &cancellables)
    }

}
