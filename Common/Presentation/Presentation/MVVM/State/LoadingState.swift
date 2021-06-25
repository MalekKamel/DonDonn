//
// Created by Shaban on 23/06/2021.
//

import SwiftUI

public class LoadingState: ObservableObject {
    @Published public var loading: LoadState = .idle

    public init() {
    }

    public enum LoadState {
        case idle
        case loading
    }

}

public class ErrorState: ObservableObject {
    @State public var error: Error = .none

    public init() {
    }

    public enum Error {
        case none
        case error(String)
    }
}

public class RouteState<Route>: ObservableObject {
    @Published public var state: Route? = nil

    public init() {
    }

}