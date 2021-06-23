//
// Created by Shaban on 23/06/2021.
//

import Foundation

public class LoadingState: ObservableObject {
    @Published public var state: State = .idle

    public init() {

    }

    public enum State {
        case idle
        case loading
        case failed(Error)
        case loaded
    }
}