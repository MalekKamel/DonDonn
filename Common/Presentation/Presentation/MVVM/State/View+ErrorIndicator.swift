//
// Created by Shaban on 23/06/2021.
//

import SwiftUI

public struct ErrorModifier: ViewModifier {
    @ObservedObject public var state: ErrorState
    public var errorView: (String) -> Alert

    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            Group {
                switch state.error {
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
    func errorIndicator(state: ErrorState,
                        errorView: @escaping (String) -> Alert) -> some View {
        modifier(ErrorModifier(
                state: state,
                errorView: errorView))
    }
}