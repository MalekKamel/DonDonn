//
// Created by Apple on 02/04/2021.
//

import SwiftUI
import Combine

public struct AsyncContentView<Source: LoadableObject,
                              LoadingView: View,
                              Content: View>: View {
    @ObservedObject var source: Source
    var loadingView: LoadingView
    var content: (Source.Output) -> Content

    public init(source: Source,
                loadingView: LoadingView,
                @ViewBuilder content: @escaping (Source.Output) -> Content) {
        self.source = source
        self.loadingView = loadingView
        self.content = content
    }

    public var body: some View {
        switch source.state {
        case .idle:
            Color.clear.onAppear(perform: source.load)
        case .loading:
            loadingView
        case .failed(let error):
            EmptyView()
                // TODO
//            ErrorView(error: error, retryHandler: source.load)
        case .loaded(let output):
            content(output)
        }
    }
}

public typealias DefaultProgressView = ProgressView<EmptyView, EmptyView>

public extension AsyncContentView where LoadingView == DefaultProgressView {
    init(
            source: Source,
            @ViewBuilder content: @escaping (Source.Output) -> Content
    ) {
        self.init(
                source: source,
                loadingView: ProgressView(),
                content: content
        )
    }
}

public extension AsyncContentView where LoadingView == DefaultProgressView {
    init<P: Publisher>(
            source: P,
            @ViewBuilder content: @escaping (P.Output) -> Content
    ) where Source == PublishedObject<P> {
        self.init(
                source: PublishedObject(publisher: source),
                loadingView: ProgressView(),
                content: content
        )
    }
}

