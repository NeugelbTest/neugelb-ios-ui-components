import NeugelbColors
import SwiftUI

struct NeugelbNavigationBarBottomTextView {

    // MARK: - Properties

    let title: String?
    let subtitle: String?
    let largeTitleViewFrame: Binding<CGRect>
    let topPadding: ViewSpacing
    let backgroundColor: ColorAsset

    // MARK: - Initialization

    init?(
        title: String?,
        subtitle: String?,
        backgroundColor: ColorAsset,
        largeTitleViewFrame: Binding<CGRect> = .init(get: { .zero }, set: { _ in }),
        topPadding: ViewSpacing = .zero
    ) {
        if title == nil, subtitle == nil { return nil }
        self.title = title
        self.subtitle = subtitle
        self.largeTitleViewFrame = largeTitleViewFrame
        self.topPadding = topPadding
        self.backgroundColor = backgroundColor
    }

}

// MARK: - View

extension NeugelbNavigationBarBottomTextView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: .spacing8) {
            largeTitleView
            subtitleView
        }
        .padding(.top, topPadding)
        .padding(.horizontal, .spacing16)
        .padding(.bottom, .spacing16)
        .backgroundColor(backgroundColor)
    }

    @ViewBuilder
    private var largeTitleView: some View {
        if let title {
            HStack {
                NeugelbText(
                    text: title,
                    weight: .semibold,
                    size: 40
                )
                Spacer()
            }
            .frameGetter(largeTitleViewFrame)
        }
    }

    @ViewBuilder
    private var subtitleView: some View {
        if let subtitle {
            HStack {
                NeugelbText(
                    text: subtitle,
                    weight: .regular,
                    size: 14,
                    textColor: .grey100,
                    lineSpacing: 8
                )
                Spacer()
            }
        }
    }

}

// MARK: - Preview

#Preview("Clear Background") {
    NeugelbNavigationBarBottomTextView(
        title: "Title",
        subtitle: PreviewAsset.loremIpsum,
        backgroundColor: .clear
    )?
    .prepareForPreview(backgroundColor: .grey50)
}

#Preview("Red Background") {
    NeugelbNavigationBarBottomTextView(
        title: "Title",
        subtitle: PreviewAsset.loremIpsum,
        backgroundColor: .red100
    )?
    .prepareForPreview(backgroundColor: .grey50)
}
