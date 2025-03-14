import NeugelbColors
import SwiftUI
import SwiftUIScrollOffset

public struct NeugelbNavigationListView<Content: View> {

    // MARK: - Typealiases

    public typealias ContentMaker = () -> Content

    // MARK: - Properties

    public let title: String?
    public let subtitle: String?
    public let backgroundColor: ColorAsset
    public let listBackgroundColor: ColorAsset
    public let rightViewContent: NavigationBarRightViewContentMaker?
    public let backButtonStyle: NavigationBarBackButtonStyle
    public let backButtonAction: ButtonActionHandler?
    public let alwaysBounceVertical: Bool
    public let content: ContentMaker

    @State private var largeTitleViewFrame = CGRect.zero

    @ScrollOffsetProxy(.top, id: "NeugelbNavigationListView_offset") private var listOffsetProxy

    private var isMainTitleHidden: Bool {
        let scrollYOffset = listOffsetProxy.offset
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
        listBackgroundColor: ColorAsset = .clear,
        rightViewContent: NavigationBarRightViewContentMaker? = nil,
        backButtonStyle: NavigationBarBackButtonStyle = .back,
        backButtonAction: ButtonActionHandler? = nil,
        alwaysBounceVertical: Bool = false,
        @ViewBuilder content: @escaping ContentMaker
    ) {
        self.title = title
        self.subtitle = subtitle
        self.backgroundColor = backgroundColor
        self.listBackgroundColor = listBackgroundColor
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
        listBackgroundColor: ColorAsset = .clear,
        rightViewContent: @autoclosure @escaping NavigationBarRightViewContentMaker,
        backButtonStyle: NavigationBarBackButtonStyle = .back,
        backButtonAction: ButtonActionHandler? = nil,
        alwaysBounceVertical: Bool = false,
        @ViewBuilder content: @escaping ContentMaker
    ) {
        self.title = title
        self.subtitle = subtitle
        self.backgroundColor = backgroundColor
        self.listBackgroundColor = listBackgroundColor
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
        listBackgroundColor: ColorAsset = .clear,
        rightViewContent: NavigationBarRightViewContentMaker? = nil,
        backButtonStyle: NavigationBarBackButtonStyle = .back,
        backButtonAction: ButtonActionHandler? = nil,
        alwaysBounceVertical: Bool = false,
        content: @autoclosure @escaping ContentMaker
    ) {
        self.title = title
        self.subtitle = subtitle
        self.backgroundColor = backgroundColor
        self.listBackgroundColor = listBackgroundColor
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
        listBackgroundColor: ColorAsset = .clear,
        rightViewContent: @autoclosure @escaping NavigationBarRightViewContentMaker,
        backButtonStyle: NavigationBarBackButtonStyle = .back,
        backButtonAction: ButtonActionHandler? = nil,
        alwaysBounceVertical: Bool = false,
        content: @autoclosure @escaping ContentMaker
    ) {
        self.title = title
        self.subtitle = subtitle
        self.backgroundColor = backgroundColor
        self.listBackgroundColor = listBackgroundColor
        self.rightViewContent = rightViewContent
        self.backButtonStyle = backButtonStyle
        self.backButtonAction = backButtonAction
        self.alwaysBounceVertical = alwaysBounceVertical
        self.content = content
    }

}

// MARK: - View

extension NeugelbNavigationListView: View {

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
            Rectangle()
                .frame(height: .size8)
                .foregroundColor(backgroundColor)
            scrollView
        }
        .hideScrollContentBackground()
        .backgroundColor(ignoredSafeAreaEdges: .all)
    }

    @MainActor
    private var scrollView: some View {
        NeugelbPlainList(alwaysBounceVertical: alwaysBounceVertical) {
            NeugelbNavigationBarBottomTextView(
                title: title,
                subtitle: subtitle,
                backgroundColor: backgroundColor,
                largeTitleViewFrame: $largeTitleViewFrame,
                topPadding: .spacing8
            )
            content()
        }
        .backgroundColor(listBackgroundColor)
        .scrollOffsetID("NeugelbNavigationListView_offset")
    }

}

// MARK: - Preview

#Preview("4 Rows") {
    NeugelbNavigationListViewPreview()
        .prepareForPreview()
}

#Preview("4 Rows & Green Background") {
    NeugelbNavigationListViewPreview(backgroundColor: .green100)
        .prepareForPreview()
}

#Preview("No Title") {
    NeugelbNavigationListViewPreview(
        title: nil,
        numberOfRows: 6
    )
    .prepareForPreview()
}

#Preview("Long Title") {
    NeugelbNavigationListViewPreview(
        title: "Very Very Very Very Very Very Very Very Very Very Long Title"
    )
    .prepareForPreview()
}

#Preview("Fit Content") {
    NeugelbNavigationListViewPreview(numberOfRows: 3)
        .prepareForPreview()
}

#Preview("5 Rows") {
    NeugelbNavigationListViewPreview(numberOfRows: 5)
        .prepareForPreview()
}

private struct NeugelbNavigationListViewPreview: View {

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
        NeugelbNavigationListView(
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
