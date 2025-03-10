import NeugelbImages
import SwiftUI

public enum NavigationBarBackButtonStyle {

    case back
    case close
    case custom(Image)

    public var image: Image {
        switch self {
        case .back:
            return ImageAsset.left.image
        case .close:
            return ImageAsset.close.image
        case .custom(let image):
            return image
        }
    }

}
