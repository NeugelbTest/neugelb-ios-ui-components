import SwiftUI

/// A List with a plain style, no separators, no row background and no row insets.
///
/// On iOS 14, `ScrollView` with `LazyVStack` is used.
public struct NeugelbPlainList<Content: View> {

    // MARK: - Typealiases

    public typealias ContentMaker = () -> Content

    // MARK: - Properties

    public let alwaysBounceVertical: Bool
    public let content: ContentMaker

    // MARK: - Initialization

    public init(
        alwaysBounceVertical: Bool = false,
        @ViewBuilder content: @escaping ContentMaker
    ) {
        self.content = content
        self.alwaysBounceVertical = alwaysBounceVertical
    }

    public init(
        alwaysBounceVertical: Bool = false,
        content: @escaping @autoclosure ContentMaker
    ) {
        self.content = content
        self.alwaysBounceVertical = alwaysBounceVertical
    }

}

// MARK: - View

extension NeugelbPlainList: View {

    public var body: some View {
        if #available(iOS 16, *) {
            contentView
                .scrollContentBackground(.hidden)
        } else {
            contentView
        }
    }

    @MainActor
    private var contentView: some View {
        List {
            content()
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
                .listRowBackground(Color.clear)
                .listRowInsets(.init())
                .removeListSectionSpacing()
        }
        .listStyle(.plain)
        .alwaysBounceVertical(alwaysBounceVertical)
    }
}

// MARK: - Preview

#Preview("With Bounce") {
    NeugelbPlainListPreview(alwaysBounceVertical: true)
}

#Preview("No Bounce") {
    NeugelbPlainListPreview(alwaysBounceVertical: false)
}

private struct NeugelbPlainListPreview: View {

    let alwaysBounceVertical: Bool

    var body: some View {
        NeugelbPlainList(alwaysBounceVertical: alwaysBounceVertical) {
            VStack {
                Text("Test 1")
                Text("Test 2")
                Text("Test 3")
            }
        }
    }

}
