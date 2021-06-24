//
// Created by Shaban on 23/06/2021.
//

import Foundation

public class ScreenState: ObservableObject {
    @Published public var loading: Loading = .idle
    @Published public var error: Error = .none

    public init() {
    }

    public enum Error {
        case none
        case error(String)
    }

    public enum Loading {
        case idle
        case loading
    }
}

public class RouteState<Route>: ObservableObject {
    @Published public var state: Route? = nil

    public init() {
    }

}