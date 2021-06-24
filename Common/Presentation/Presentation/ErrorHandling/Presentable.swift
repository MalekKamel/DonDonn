//
// Created by Shaban on 23/06/2021.
//

import Foundation


/// This protocol is responsible for presenting UI
public protocol Presentable {

    ///  show error string
    func showError(error: String)

    /// show loading indicator
    func showLoading()

    /// hide loading indicator
    func hideLoading()

    /// called when no error handler can handle the exception
    func onHandleErrorFailed(error: Error)
}

public class DummyPresentable: Presentable {
    public init() {
    }

    public func showError(error: String) {
    }

    public func showLoading() {
    }

    public func hideLoading() {
    }

    public func onHandleErrorFailed(error: Error) {
    }

}