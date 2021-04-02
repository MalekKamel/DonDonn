//
// Created by Apple on 02/04/2021.
//

import SwiftUI

public protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
}