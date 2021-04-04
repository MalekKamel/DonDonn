//
// Created by Apple on 04/04/2021.
//

import SwiftUI

/// A protocol that abstracts the common functionalities of a screen
/// The screen represents the main container that covers all the device screen.
/// NOT a single component.
public protocol AppScreen: View {
    associatedtype Presenter: AppPresenter

    /// The presenter of this screen
    var presenter: Presenter { get set }

    /// The main container for the whole screen
    /// - Returns: AnyView
    func BodyView() -> AnyView

    /// The normal content view that should be shown to
    /// the user in the normal state.
    /// - Returns: AnyView
    func ContentView() -> AnyView

    /// The screen initial view.
    /// This view appears on loading the screen first time.
    /// - Returns: AnyView
    func InitialView() -> AnyView

    /// The screen loading view.
    /// - Returns: AnyView
    func LoadingView() -> AnyView

    /// The screen error view.
    /// - Returns: AnyView
    func ErrorView(error: Swift.Error) -> AnyView

    /// Called when the initial view appears.
    /// By default, this function loads the content view by changing
    /// the screen state to loaded.
    /// Override this function to do call API for example before
    /// showing the content view.
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
        // Show the content view by default
        presenter.screenState = .loaded
    }

    func LoadingView() -> AnyView {
        ProgressView().eraseToAnyView()
    }

    func ErrorView(error: Swift.Error) -> AnyView {
        Text(error.localizedDescription).eraseToAnyView()
    }

}
