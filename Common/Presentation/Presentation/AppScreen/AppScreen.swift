//
// Created by Apple on 04/04/2021.
//

import SwiftUI

public protocol AppScreen: View {
    associatedtype Presenter: AppPresenter
    var presenter: Presenter { get set }

    func BodyView() -> AnyView
    func ContentView() -> AnyView
    func InitialView() -> AnyView
    func LoadingView() -> AnyView
    func ErrorView(error: Swift.Error) -> AnyView
    func onInitialViewAppear()
}

public extension AppScreen {

    var body: some View {
        BodyView()
    }

    func BodyView() -> AnyView {
        switch presenter.screenState {
        case .idle:
            return  InitialView().onAppear(perform: onInitialViewAppear).eraseToAnyView()
        case .loading:
            return LoadingView().eraseToAnyView()
        case .failed(let error):
            return ErrorView(error: error).eraseToAnyView()
        case .loaded:
            return ContentView().eraseToAnyView()
        }
    }

    func InitialView() -> AnyView {
        Color.clear.eraseToAnyView()
    }

    func onInitialViewAppear() {
        // Default implementation
        presenter.screenState = .loaded
    }

    func LoadingView() -> AnyView {
        ProgressView().eraseToAnyView()
    }

    func ErrorView(error: Swift.Error) -> AnyView {
        Text(error.localizedDescription).eraseToAnyView()
    }

}
