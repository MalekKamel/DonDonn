//
// Created by Apple on 04/04/2021.
//

import SwiftUI
import Data

public protocol AppPresenter: ObservableObject {
    var state: ScreenState { get set }
}
