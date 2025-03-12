import UIKit

public protocol ImageService {
    func loadImage(from path: String) async -> ImageStatus
}
