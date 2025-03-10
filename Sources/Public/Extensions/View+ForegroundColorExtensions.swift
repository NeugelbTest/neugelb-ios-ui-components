import NeugelbColors
import SwiftUI

public extension View {

    /// Sets the color of the foreground elements displayed by this view.
    /// - Parameter colorAsset: The foreground color asset to use when displaying this view. Pass `nil` to remove any custom foreground color and to allow the system or the container to provide its own foreground color. If a container-specific override doesn't exist, the system uses the primary color.
    /// - Returns: A view that uses the foreground color you supply.
    func foregroundColor(_ colorAsset: ColorAsset?) -> some View {
        foregroundColor(colorAsset?.color)
    }

    /// Sets `.clear` color to the foreground elements displayed by this view.
    /// - Returns: A view that uses `.clear` foreground color.
    func clearForegroundColor() -> some View {
        foregroundColor(Color.clear)
    }

}
