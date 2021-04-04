//
// Created by Apple on 04/04/2021.
//

import SwiftUI
import Combine
import Data

public protocol AppPresenterProtocol: ObservableObject {
    var state: ScreenState { get set }
    var cancellables: Set<AnyCancellable> { get set }
}

public extension AppPresenterProtocol {

    func request<T>(_ api: AnyPublisher<T, Swift.Error>, completion: @escaping (T) -> Void) {
        api.catch { error -> Empty<T, Never> in
                    self.state = .failed(error)
                    return Empty<T, Never>()
                }
                .sink(receiveValue: { [weak self] value in
                    completion(value)
                    self?.state = .loaded
                })
                .store(in: &cancellables)
    }

}
