//
// Created by Shaban on 23/06/2021.
//

import SwiftUI

public struct LoadingModifier: ViewModifier {
    @ObservedObject public var loadingState: ScreenState
    public var loadingView: AnyView
    public var errorView: (String) -> Alert

    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                switch loadingState.loading {
                case .idle:
                    content.eraseToAnyView()
                case .loading:
                    ZStack {
                        content
                        loadingView
                    }.eraseToAnyView()
                }

                switch loadingState.error {
                case .none:
                    content.eraseToAnyView()
                case .error(let error):
                    content.alert(isPresented: .constant(true)) {
                        errorView(error)
                    }.eraseToAnyView()
                }
            }
        }
    }
}

public extension View {
    func loadingIndicator(loadingState: ScreenState,
                          loadingView: AnyView,
                          errorView: @escaping (String) -> Alert) -> some View {
        modifier(LoadingModifier(
                loadingState: loadingState,
                loadingView: loadingView,
                errorView: errorView))
    }
}