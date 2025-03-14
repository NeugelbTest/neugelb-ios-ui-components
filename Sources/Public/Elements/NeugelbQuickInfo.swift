//
//  NeugelbQuickInfo.swift
//  NeugelbUIComponents
//
//  Created by Matt on 14.03.25.
//
import NeugelbColors
import NeugelbImages
import SwiftUI

public struct NeugelbQuickInfo {

    // MARK: - Properties

    let type: QuickInfoType
    let value: String

    // MARK: - Initialization

    public init(
        type: QuickInfoType,
        value: String
    ) {
        self.type = type
        self.value = value
    }

}

// MARK: - View

extension NeugelbQuickInfo: View {

    public var body: some View {
        HStack(spacing: .spacing8) {
            type.image.image
                .renderingMode(.template)
                .resizable()
                .foregroundColor(type.color)
                .aspectRatio(contentMode: .fill)
                .frame(width: Constant.iconSize, height: Constant.iconSize)
            NeugelbText(
                text: value,
                size: 12,
                textColor: type.color
            )
        }
    }
}

// MARK: - Constants

private extension NeugelbQuickInfo {

    enum Constant {

        static let iconSize: CGFloat = 16
    }

}

// MARK: - Preview

#Preview {
    VStack {
        NeugelbQuickInfo(type: .star, value: "9.6")
        NeugelbQuickInfo(type: .calendar, value: "2030-01-23")
        NeugelbQuickInfo(type: .ticket, value: "en")
    }
    .prepareForPreview()
}
