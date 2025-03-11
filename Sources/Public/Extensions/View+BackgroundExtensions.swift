import NeugelbColors
import SwiftUI

public extension View {

    /// Layers the given color behind this view.
    /// - Parameter colorAsset: The color to draw behind this view.
    func backgroundColor(_ colorAsset: ColorAsset = .clear) -> some View {
        modifier(BackgroundColorByAsset(
            colorAsset: colorAsset,
            ignoredSafeAreaRegions: .all,
            ignoredSafeAreaEdges: nil
        ))
    }
    
    /// Layers the given color behind this view. The color is expanded out of its safe area.
    /// - Parameters:
    ///   - colorAsset: The color to draw behind this view.
    ///   - ignoredSafeAreaRegions: The kinds of rectangles removed from the safe area that should be ignored (i.e. added back to the safe area of the new child view).
    ///   - ignoredSafeAreaEdges: The edges of the view that may be outset. Any edges not in this set will be unchanged, even if that edge is abutting a safe area listed in `regions`.
    func backgroundColor(
        _ colorAsset: ColorAsset = .clear,
        ignoredSafeAreaRegions: SafeAreaRegions = .all,
        ignoredSafeAreaEdges: Edge.Set
    ) -> some View {
        modifier(BackgroundColorByAsset(
            colorAsset: colorAsset,
            ignoredSafeAreaRegions: ignoredSafeAreaRegions,
            ignoredSafeAreaEdges: ignoredSafeAreaEdges
        ))
    }

}

// MARK: - BackgroundColorByAsset Modifier

private struct BackgroundColorByAsset: ViewModifier {

    let colorAsset: ColorAsset
    let ignoredSafeAreaRegions: SafeAreaRegions
    let ignoredSafeAreaEdges: Edge.Set?

    func body(content: Content) -> some View {
        if let ignoredSafeAreaEdges {
            content.background(colorAsset.color.ignoresSafeArea(ignoredSafeAreaRegions, edges: ignoredSafeAreaEdges))
        } else {
            content.background(colorAsset.color)
        }
    }

}
