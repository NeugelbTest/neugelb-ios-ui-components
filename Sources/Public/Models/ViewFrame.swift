import SwiftUI

public struct ViewFrame {

    // MARK: - Properties

    public let idealWidth: CGFloat?
    public let idealHeight: CGFloat?
    public let minWidth: CGFloat?
    public let minHeight: CGFloat?
    public let maxWidth: CGFloat?
    public let maxHeight: CGFloat?
    public let alignment: Alignment

    // MARK: - Initialization

    public init(
        ideadWidth: CGFloat? = nil,
        idealHeight: CGFloat? = nil,
        minWidth: CGFloat? = nil,
        minHeight: CGFloat? = nil,
        maxWidth: CGFloat? = nil,
        maxHeight: CGFloat? = nil,
        alignment: Alignment = .center
    ) {
        self.idealWidth = ideadWidth
        self.idealHeight = idealHeight
        self.minWidth = minWidth
        self.minHeight = minHeight
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.alignment = alignment
    }

    public init(
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        alignment: Alignment = .center
    ) {
        self.idealWidth = width
        self.idealHeight = height
        self.minWidth = width
        self.minHeight = height
        self.maxWidth = width
        self.maxHeight = height
        self.alignment = alignment
    }

    public init(size: CGFloat, alignment: Alignment = .center) {
        self.init(width: size, height: size, alignment: alignment)
    }

}
