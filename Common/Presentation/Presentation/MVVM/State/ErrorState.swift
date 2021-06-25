//
// Created by Shaban on 25/06/2021.
//

import SwiftUI

public class ErrorState: ObservableObject {
    @State public var error: Error = .none

    public init() {
    }

    public enum Error {
        case none
        case error(String)
    }
}
