//
// Created by Shaban on 23/06/2021.
//

import SwiftUI

public struct LoadingModifier: ViewModifier {
    @ObservedObject public var loadingState: LoadingState
    public  var loadingView: AnyView
    public var errorView: (Swift.Error) -> Alert

    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                switch loadingState.state {
                case .idle,
                     .loaded:
                    content.eraseToAnyView()
                case .loading:
                    ZStack {
                        content
                        loadingView
                    }.eraseToAnyView()
                case .failed(let error):
                    content.alert(isPresented: .constant(true)) {
                        errorView(error)
                    }.eraseToAnyView()
                }
            }
        }
    }
}

public extension View {
    func loadingIndicator(loadingState: LoadingState,
                          loadingView: AnyView,
                          errorView: @escaping (Swift.Error) -> Alert) -> some View {
        modifier(LoadingModifier(
                loadingState: loadingState,
                loadingView: loadingView,
                errorView: errorView))
    }
}