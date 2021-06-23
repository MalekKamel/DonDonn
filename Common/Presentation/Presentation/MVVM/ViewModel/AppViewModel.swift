//
// Created by Apple on 04/04/2021.
//

import SwiftUI
import Data
import Core
import Combine

public protocol AppViewModel: ObservableObject {
    associatedtype ScreenRoute: AppRoute
    var route: ScreenRoute? { get set }
    var routePublisher: Published<ScreenRoute?>.Publisher { get }

    var loadingState: LoadingState { get set }
    var bag: CancelableBag { get set }
    var dataManager: DataManager { get set }
    func request<T>(_ api: AnyPublisher<T, Swift.Error>,
                    onError: ((Swift.Error) -> Void)?,
                    completion: @escaping (T) -> Void)
}

public extension AppViewModel {

    func request<T>(_ api: AnyPublisher<T, Swift.Error>,
                    onError: ((Swift.Error) -> Void)? = nil,
                    subject: NeverSubject<T>) {
        request(api, onError: onError) { [weak self] value in
            guard let self = self else {
                return
            }
            subject.send(value)
            subject.send(completion: Subscribers.Completion<Never>.finished)
            self.loadingState.state  = .loaded
        }
    }

    func request<T>(_ api: AnyPublisher<T, Swift.Error>,
                    onError: ((Swift.Error) -> Void)? = nil,
                    completion: @escaping (T) -> Void) {
        loadingState.state = .loading
        CombineRequester().request(
                        api,
                        onError: { [weak self] error in
                            onError?(error)
                            self?.loadingState.state  = .failed(error)
                        },
                        completion: { [weak self] value in
                            completion(value)
                            self?.loadingState.state  = .loaded
                        })
                .store(in: &bag)
    }

}