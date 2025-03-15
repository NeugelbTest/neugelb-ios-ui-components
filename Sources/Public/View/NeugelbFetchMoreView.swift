import SwiftUI

public struct NeugelbFetchMoreView {

    // MARK: - Properties

    public let onAppear: EmptyHandler

    // MARK: - Initialization

    public init(onAppear: @escaping EmptyHandler) {
        self.onAppear = onAppear
    }

    public init(onAppear: @escaping EmptyAsyncHandler) {
        self.onAppear = { Task {
            await onAppear()
        }}
    }

}

// MARK: - View

extension NeugelbFetchMoreView: View {

    public var body: some View {
        NeugelbSpinnerView(size: 24)
            .padding()
            .onAppear(perform: onAppear)
    }

}

// MARK: - Preview

#Preview("Fetch More") {
    NeugelbFetchMoreView(onAppear: PreviewAsset.tapAction)
        .prepareForPreview()
}

#Preview("Fetch More With Content On Top") {
    VStack {
        Text(PreviewAsset.loremIpsum)
        NeugelbFetchMoreView(onAppear: PreviewAsset.tapAction)
    }
    .prepareForPreview()
}

#Preview("Fetch More With Content") {
    VStack {
        Text(PreviewAsset.loremIpsum)
        NeugelbFetchMoreView(onAppear: PreviewAsset.tapAction)
        Text(PreviewAsset.loremIpsum)
    }
    .prepareForPreview()
}
