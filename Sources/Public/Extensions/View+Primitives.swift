import SwiftUI

// MARK: - Stacks

public extension HStack {

    init(
        alignment: VerticalAlignment = .center,
        spacing: ViewSpacing,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing.rawValue,
            content: content
        )
    }

}

// MARK: - Padding

public extension View {

    func padding(_ edges: Edge.Set = .all, _ length: ViewSpacing) -> some View {
        padding(edges, length.rawValue)
    }

    func padding(_ length: ViewSpacing) -> some View {
        padding(length.rawValue)
    }

}

// MARK: - Frame

public extension View {

    func frame(width: ViewSize, alignment: Alignment = .center) -> some View {
        frame(width: width.rawValue, height: nil, alignment: alignment)
    }

    func frame(height: ViewSize, alignment: Alignment = .center) -> some View {
        frame(width: nil, height: height.rawValue, alignment: alignment)
    }

    func frame(width: ViewSize, height: ViewSize, alignment: Alignment = .center) -> some View {
        frame(width: width.rawValue, height: height.rawValue, alignment: alignment)
    }

}

public extension VStack {

    init(
        alignment: HorizontalAlignment = .center,
        spacing: ViewSpacing,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing.rawValue,
            content: content
        )
    }

}
