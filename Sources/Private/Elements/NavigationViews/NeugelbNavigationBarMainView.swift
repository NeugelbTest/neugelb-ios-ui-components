import NeugelbColors
import NeugelbImages
import SwiftUI

struct NeugelbNavigationBarMainView {

    // MARK: - Properties

    let title: String?
    let isTitleHidden: Bool
    let backgroundColor: ColorAsset
    let rightViewContent: NavigationBarRightViewContentMaker?
    let backButtonStyle: NavigationBarBackButtonStyle
    let backButtonAction: ButtonActionHandler?

    @State private var backButtonFrame = CGRect.zero
    @State private var leftViewFrame = CGRect.zero

    private var sideViewWidth: CGFloat {
        max(backButtonFrame.width, leftViewFrame.width)
    }

}

// MARK: - View

extension NeugelbNavigationBarMainView: View {

    var body: some View {
        HStack {
            backButtonView
            Spacer()
            titleView
            Spacer()
            rightView
        }
        .frame(minHeight: ViewSize.size48.rawValue)
        .padding(.horizontal, .spacing24)
        .padding(.vertical, .spacing8)
        .backgroundColor(backgroundColor, ignoredSafeAreaEdges: .top)
    }

    @ViewBuilder
    private var backButtonView: some View {
        if let backButtonAction {
            Button(action: backButtonAction) {
                NeugelbImage(
                    backButtonStyle.image,
                    size: .size24
                )
                .frameGetter($backButtonFrame)
                .frame(width: sideViewWidth, alignment: .leading)
            }
        }
    }

    @ViewBuilder
    private var titleView: some View {
        if let title {
            NeugelbText(
                text: title,
                weight: .bold,
                size: 18,
                lineLimit: 1
            )
            .fillWidth(with: .center)
            .hidden(isTitleHidden)
        }
    }

    @ViewBuilder
    private var rightView: some View {
        if rightViewContent == nil, backButtonAction != nil {
            // Add empty view to properly center the title.
            HStack {}.frame(width: sideViewWidth)
        } else {
            rightViewContent?()
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: false)
                .frameGetter($leftViewFrame)
                .frame(width: sideViewWidth, alignment: .trailing)
        }
    }

}

// MARK: - Preview

#Preview("Back Button & Title & Right Item") {
    NeugelbNavigationBarMainView.Preview()
}

#Preview {
    NeugelbNavigationBarMainView.Preview(backgroundColor: .red100)
}

#Preview("Back Button & Long Title & Right Item") {
    NeugelbNavigationBarMainView.Preview(title: PreviewAsset.loremIpsum)
}

#Preview("Back Button & Right Item") {
    NeugelbNavigationBarMainView.Preview(title: nil)
}

#Preview("Back Button & Title") {
    NeugelbNavigationBarMainView.Preview(withRightView: false)
}

#Preview("Back Button & Long Title") {
    NeugelbNavigationBarMainView.Preview(
        title: PreviewAsset.loremIpsum,
        withRightView: false
    )
}

#Preview("Back Button") {
    NeugelbNavigationBarMainView.Preview(
        title: nil,
        withRightView: false
    )
}

#Preview("Close Button") {
    NeugelbNavigationBarMainView.Preview(
        backgroundColor: .grey10,
        backButtonStyle: .close
    )
}

#Preview("Title") {
    NeugelbNavigationBarMainView.Preview(
        withRightView: false,
        withBackButton: false
    )
}

#Preview("Long Title") {
    NeugelbNavigationBarMainView.Preview(
        title: PreviewAsset.loremIpsum,
        withRightView: false,
        withBackButton: false
    )
}

fileprivate extension NeugelbNavigationBarMainView {

    struct Preview: View {

        let title: String?
        let withRightView: Bool
        let withBackButton: Bool
        let backgroundColor: ColorAsset
        let backButtonStyle: NavigationBarBackButtonStyle

        init(
            title: String? = "Title",
            withRightView: Bool = true,
            withBackButton: Bool = true,
            backgroundColor: ColorAsset = .clear,
            backButtonStyle: NavigationBarBackButtonStyle = .back
        ) {
            self.title = title
            self.withRightView = withRightView
            self.withBackButton = withBackButton
            self.backgroundColor = backgroundColor
            self.backButtonStyle = backButtonStyle
        }

        var body: some View {
            VStack {
                NeugelbNavigationBarMainView(
                    title: title,
                    isTitleHidden: false,
                    backgroundColor: backgroundColor,
                    rightViewContent: withRightView ? leftViewContent : nil,
                    backButtonStyle: backButtonStyle,
                    backButtonAction: withBackButton ? PreviewAsset.tapAction : nil
                )
                Spacer()
            }
            .prepareForPreview()
        }

        private var leftViewContent: NavigationBarRightViewContentMaker {
            Button(
                "Left Item",
                action: PreviewAsset.tapAction
            )
            .eraseToAnyView
        }

    }

}
