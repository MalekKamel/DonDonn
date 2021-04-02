//
// Created by Apple on 02/04/2021.
//

import SwiftUI
import Combine

public class PublishedObject<Wrapped: Publisher>: LoadableObject {
    public var state = LoadingState<Wrapped.Output>.idle {
        willSet {
            objectWillChange.send()
        }
    }

    private let publisher: Wrapped
    private var cancellable: AnyCancellable?

    public init(publisher: Wrapped) {
        self.publisher = publisher
    }

    public func load() {
        state = .loading

        cancellable = publisher
                .map { output in
                    LoadingState.loaded(output)
                }
                .catch { error in
                    Just(LoadingState.failed(error))
                }
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { value in
                    self.state = value
                })
    }
}