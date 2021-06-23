//
// Created by Shaban on 23/06/2021.
//

import Combine

public class CombineRequester {

    public func request<T>(_ api: AnyPublisher<T, Swift.Error>,
                           onError: ((Swift.Error) -> Void)? = nil,
                           completion: @escaping (T) -> Void) -> AnyCancellable {
        api
                .subscribe(on: RunLoop.current)
                .receive(on: RunLoop.main)
                .catch { error -> Empty<T, Never> in
                    onError?(error)
                    return Empty<T, Never>()
                }
                .sink(receiveValue: { value in
                    completion(value)
                })
    }
}