import NeugelbColors
import SwiftUI

public struct NeugelbNavigationScrollView<Content: View> {

    // MARK: - Typealiases

    public typealias ContentMaker = () -> Content

    // MARK: - Properties

    public let title: String?
    public let subtitle: String?
    public let backgroundColor: ColorAsset
    public let rightViewContent: NavigationBarRightViewContentMaker?
    public let backButtonStyle: NavigationBarBackButtonStyle
    public let backButtonAction: ButtonActionHandler?
    public let alwaysBounceVertical: Bool
    public let content: ContentMaker

    @State private var scrollYOffset = CGFloat.zero
    @State private var largeTitleViewFrame = CGRect.zero

    private var isMainTitleHidden: Bool {
        if scrollYOffset > 0 { return true }
        let heightToCompare = scrollYOffset
            + largeTitleViewFrame.height
        + ViewSize.size8.rawValue
        return heightToCompare > 0
    }

    // MARK: - Initialization

    public init(
        title: String? = nil,
        subtitle: String? = nil,
        backgroundColor: ColorAsset = .clear,
        rightViewContent: NavigationBarRightViewContentMaker? = nil,
        backButtonStyle: NavigationBarBackButtonStyle = .back,
        backButtonAction: ButtonActionHandler? = nil,
        alwaysBounceVertical: Bool = false,
        @ViewBuilder content: @escaping ContentMaker
    ) {
        self.title = title
        self.subtitle = subtitle
        self.backgroundColor = backgroundColor
        self.rightViewContent = rightViewContent
        self.backButtonStyle = backButtonStyle
        self.backButtonAction = backButtonAction
        self.alwaysBounceVertical = alwaysBounceVertical
        self.content = content
    }

    public init(
        title: String? = nil,
        subtitle: String? = nil,
        backgroundColor: ColorAsset = .clear,
        rightViewContent: @autoclosure @escaping NavigationBarRightViewContentMaker,
        backButtonStyle: NavigationBarBackButtonStyle = .back,
        backButtonAction: ButtonActionHandler? = nil,
        alwaysBounceVertical: Bool = false,
        @ViewBuilder content: @escaping ContentMaker
    ) {
        self.title = title
        self.subtitle = subtitle
        self.backgroundColor = backgroundColor
        self.rightViewContent = rightViewContent
        self.backButtonStyle = backButtonStyle
        self.backButtonAction = backButtonAction
        self.alwaysBounceVertical = alwaysBounceVertical
        self.content = content
    }

    public init(
        title: String? = nil,
        subtitle: String? = nil,
        backgroundColor: ColorAsset = .clear,
        rightViewContent: NavigationBarRightViewContentMaker? = nil,
        backButtonStyle: NavigationBarBackButtonStyle = .back,
        backButtonAction: ButtonActionHandler? = nil,
        alwaysBounceVertical: Bool = false,
        content: @autoclosure @escaping ContentMaker
    ) {
        self.title = title
        self.subtitle = subtitle
        self.backgroundColor = backgroundColor
        self.rightViewContent = rightViewContent
        self.backButtonStyle = backButtonStyle
        self.backButtonAction = backButtonAction
        self.alwaysBounceVertical = alwaysBounceVertical
        self.content = content
    }

    public init(
        title: String? = nil,
        subtitle: String? = nil,
        backgroundColor: ColorAsset = .clear,
        rightViewContent: @autoclosure @escaping NavigationBarRightViewContentMaker,
        backButtonStyle: NavigationBarBackButtonStyle = .back,
        backButtonAction: ButtonActionHandler? = nil,
        alwaysBounceVertical: Bool = false,
        content: @autoclosure @escaping ContentMaker
    ) {
        self.title = title
        self.subtitle = subtitle
        self.backgroundColor = backgroundColor
        self.rightViewContent = rightViewContent
        self.backButtonStyle = backButtonStyle
        self.backButtonAction = backButtonAction
        self.alwaysBounceVertical = alwaysBounceVertical
        self.content = content
    }

}

// MARK: - View

extension NeugelbNavigationScrollView: View {

    public var body: some View {
        VStack(spacing: .zero) {
            NeugelbNavigationBarMainView(
                title: title,
                isTitleHidden: isMainTitleHidden,
                backgroundColor: backgroundColor,
                rightViewContent: rightViewContent,
                backButtonStyle: backButtonStyle,
                backButtonAction: backButtonAction
            )
            scrollView
        }
        .backgroundColor(ignoredSafeAreaEdges: .all)
    }

    @MainActor
    private var scrollView: some View {
        ScrollView {
            offsetReader
            NeugelbNavigationBarBottomTextView(
                title: title,
                subtitle: subtitle,
                backgroundColor: backgroundColor,
                largeTitleViewFrame: $largeTitleViewFrame,
                topPadding: .spacing8
            )
            content()
        }
        .backgroundColor(backgroundColor)
        .coordinateSpace(name: Constant.coordinateSpaceName)
        .onPreferenceChange(OffsetPreferenceKey.self) {
            scrollYOffset = $0
        }
        .alwaysBounceVertical(alwaysBounceVertical)
    }

    private var offsetReader: some View {
        GeometryReader { proxy in
            Color.clear.preference(
                key: OffsetPreferenceKey.self,
                value: proxy.frame(in: .named(Constant.coordinateSpaceName)).minY
            )
        }
        .frame(height: .zero)
    }

}

// MARK: - Constants

private enum Constant {

    static let coordinateSpaceName = "frameLayer"

}

// MARK: - OffsetPreferenceKey

/// Contains the gap between the smallest value for the y-coordinate of
/// the frame layer and the content layer.
private struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

// MARK: - Preview

#Preview("4 Rows") {
    NeugelbNavigationScrollViewPreview()
        .prepareForPreview()
}

#Preview("4 Rows & Green Background") {
    NeugelbNavigationScrollViewPreview(backgroundColor: .green100)
        .prepareForPreview()
}

#Preview("No Title") {
    NeugelbNavigationScrollViewPreview(
        title: nil,
        numberOfRows: 6
    )
    .prepareForPreview()
}

#Preview("Long Title") {
    NeugelbNavigationScrollViewPreview(
        title: "Very Very Very Very Very Very Very Very Very Very Long Title"
    )
    .prepareForPreview()
}

#Preview("Fit Content") {
    NeugelbNavigationScrollViewPreview(numberOfRows: 3)
        .prepareForPreview()
}

#Preview("5 Rows") {
    NeugelbNavigationScrollViewPreview(numberOfRows: 5)
        .prepareForPreview()
}

private struct NeugelbNavigationScrollViewPreview: View {

    let title: String?
    let numberOfRows: Int
    let backgroundColor: ColorAsset

    init(
        title: String? = "Title",
        numberOfRows: Int = 4,
        backgroundColor: ColorAsset = .clear
    ) {
        self.title = title
        self.numberOfRows = numberOfRows
        self.backgroundColor = backgroundColor
    }

    var body: some View {
        NeugelbNavigationScrollView(
            title: title,
            subtitle: PreviewAsset.loremIpsum,
            backgroundColor: backgroundColor,
            rightViewContent: leftViewContent,
            backButtonAction: PreviewAsset.tapAction
        ) {
            ForEach(0...numberOfRows, id: \.self) { _ in
                Rectangle()
                    .frame(height: 85)
                    .foregroundColor(.red)
            }
        }
    }

    private var leftViewContent: AnyView {
        Button("Left Item", action: PreviewAsset.tapAction)
            .eraseToAnyView()
    }

}
