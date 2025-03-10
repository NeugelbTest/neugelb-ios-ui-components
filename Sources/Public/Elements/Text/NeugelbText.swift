import SwiftUI
import NeugelbColors
import NeugelbFonts

public struct NeugelbText {

    // MARK: - Properties

    public let text: String
    public let weight: NeugelbFonts.FontWeightName
    public let size: Int
    public let textColor: ColorAsset
    public let lineLimit: Int?
    public let lineSpacing: Double
    public let alignment: TextAlignment

    // MARK: - Initialization

    public init(
        text: String,
        weight: NeugelbFonts.FontWeightName = .regular,
        size: Int,
        textColor: ColorAsset = .grey10,
        lineLimit: Int? = nil,
        lineSpacing: Double = 0.0,
        alignment: TextAlignment = .leading
    ) {
        self.text = text
        self.weight = weight
        self.size = size
        self.textColor = textColor
        self.lineLimit = lineLimit
        self.lineSpacing = lineSpacing
        self.alignment = alignment
    }

}

// MARK: - View

extension NeugelbText: View {

    public var body: some View {
        Text(text)
            .font(NeugelbFonts.brandingFontWith(weight: weight, size: size))
            .foregroundColor(textColor.color)
            .lineLimit(lineLimit)
            .lineSpacing(lineSpacing)
            .multilineTextAlignment(alignment)
    }

}


// MARK: - Preview

#Preview {
    
    VStack(alignment: .leading, spacing: .spacing16) {
        NeugelbText(
            text: "Copy Text",
            size: 12
        )
        NeugelbText(
            text: "Copy Text",
            size: 16
        )
        NeugelbText(
            text: "Copy Text",
            size: 24
        )
        NeugelbText(
            text: "Copy Text",
            size: 32
        )
    }
    .prepareForPreview()
}

#Preview("Line Limit") {
    VStack(alignment: .leading, spacing: .spacing16) {
        NeugelbText(
            text: PreviewAsset.loremIpsum,
            size: 12,
            lineLimit: nil
        )
        NeugelbText(
            text: PreviewAsset.loremIpsum,
            size: 12,
            lineLimit: 1
        )
        NeugelbText(
            text: PreviewAsset.loremIpsum,
            size: 12,
            lineLimit: nil,
            lineSpacing: 10
        )
    }
    .prepareForPreview()
}
