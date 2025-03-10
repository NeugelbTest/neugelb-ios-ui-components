import SwiftUI

public extension View {

    func frameGetter(_ frame: Binding<CGRect>) -> some View {
        modifier(FrameGetter(frame: frame))
    }

}

// MARK: - FrameGetter Modifier

private struct FrameGetter: ViewModifier {

    @Binding var frame: CGRect

    func body(content: Content) -> some View {
        content.background(GeometryReader {
            let rect = $0.frame(in: .global)
            // This avoids an infinite layout loop
            if rect.integral != self.frame.integral {
                DispatchQueue.main.async {
                    self.frame = rect
                }
            }
            return EmptyView().eraseToAnyView()
        })
    }

}
