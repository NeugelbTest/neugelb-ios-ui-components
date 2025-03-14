import UIKit
import NeugelbImages
import NeugelbColors

public enum QuickInfoType {
    case star
    case calendar
    case ticket
    
    var image: ImageAsset.Asset {
        switch self {
        case .star:
            ImageAsset.star
        case .calendar:
            ImageAsset.calendar
        case .ticket:
            ImageAsset.ticket
        }
    }
    
    var color: ColorAsset {
        switch self {
        case .star:
                .orange100
        case .calendar:
                .grey10
        case .ticket:
                .grey10
        }
    }
}
