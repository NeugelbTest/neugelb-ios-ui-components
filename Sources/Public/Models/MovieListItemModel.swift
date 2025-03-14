import Foundation
import NeugelbNetwork

public extension MovieListItem {

    struct Model: Identifiable {

        // MARK: - Properties

        public let id: Int
        public let title: String?
        public let imageUrl: String?
        public let rate: Double?
        public let overview: String?
        public let releaseDate: String?
        public let language: String?
        public let imageService: ImageService?
        public let detailButtonActionHandler: ValueHandler<Int>?

        func fetchImage() async -> ImageStatus {
            guard let imageService = imageService, let url = imageUrl else {
                return .failed
            }
            do {
                guard let image = try await imageService.fetchImage(from: url) else {
                    return .failed
                }
                return .success(image)
            } catch {
                return .failed
            }
        }

        var rateString: String? {
            guard let rate else { return nil }
            return "\(rate)"
        }
    }

}
