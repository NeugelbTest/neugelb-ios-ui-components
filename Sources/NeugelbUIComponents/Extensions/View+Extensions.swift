import SwiftUI
import NeugelbFonts

public extension View {
    
    func onLoad(closure: () -> Void) -> some View {
        LogicLoader(closure, content: self)
    }
    
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
    
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
    
    func addUnderline() -> some View {
        if #available(iOS 16.0, *) {
            return self.underline()
        }
        return self
    }
    
    func font(weight: NeugelbFonts.FontWeightName, size: Int) -> some View {
        font(NeugelbFonts.brandingFontWith(weight: weight, size: size))
    }
    
    /// A convenient method that allows you to easily create a view that occupies the full width of its parent container, using an optional alignment parameter to specify the horizontal alignment within the available space.
    ///
    /// This method relies on the `frame(maxWidth:alignment:)` modifier internally to achieve the desired behavior.
    /// - Parameter alignment: An Alignment value that determines the horizontal alignment of the view within the available space. The default value is `.leading`.
    /// - Returns: A modified view that has been adjusted to fill the entire width of its parent container, using the specified alignment.
    func fillWidth(with alignment: Alignment = .leading) -> some View {
        frame(maxWidth: .infinity, alignment: alignment)
    }
    
}

// MARK: - LogicLoader

private struct LogicLoader<T>: View where T: View {

    var body: some View {
        content
    }

    private var content: T

    init(_ closure: () -> Void, content: T) {
        closure()
        self.content = content
    }

}
