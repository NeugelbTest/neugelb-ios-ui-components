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

    let model: NeugelbQuickInfo.Model
    let value: String

    // MARK: - Initialization

    public init(
        model: NeugelbQuickInfo.Model,
        value: String
    ) {
        self.model = model
        self.value = value
    }

}

// MARK: - View

extension NeugelbQuickInfo: View {

    public var body: some View {
        HStack(spacing: .spacing8) {
            model.image.image
                .renderingMode(.template)
                .resizable()
                .foregroundColor(model.color)
                .aspectRatio(contentMode: .fill)
                .frame(width: Constant.iconSize, height: Constant.iconSize)
            NeugelbText(
                text: value,
                size: 12,
                textColor: model.color
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
        NeugelbQuickInfo(model: .star, value: "9.6")
        NeugelbQuickInfo(model: .calendar, value: "2030-01-23")
        NeugelbQuickInfo(model: .ticket, value: "en")
    }
    .prepareForPreview()
}
