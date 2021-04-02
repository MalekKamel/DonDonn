//
// Created by Apple on 02/04/2021.
//

import SwiftUI
import Combine

public enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
