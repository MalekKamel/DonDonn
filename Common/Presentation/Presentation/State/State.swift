//
// Created by Apple on 04/04/2021.
//

import Foundation

public enum ScreenState {
    case idle
    case loading
    case failed(Error)
    case loaded
}
