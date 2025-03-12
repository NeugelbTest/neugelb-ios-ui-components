import Foundation

public extension MovieListItem {

    struct Model: Identifiable {

        // MARK: - Properties

        public let id: String
        public let name: String?
        public let imageUrl: String?
        public let rate: Double?
        public let genre: String?
        public let year: Int?
        public let time: Int?
        public let imageService: ImageService?
        public let detailButtonActionHandler: ValueHandler<String>?
        
        func fetchImage() async -> ImageStatus {
            guard let imageService else { return .failed }
            return await imageService.loadImage(from: imageUrl ?? "")
        }
        
        var yearString: String? {
            guard let year else { return nil }
            return "\(year)"
        }
        
        var timeString: String? {
            guard let time else { return nil }
            return "\(time) minutes"
        }
        
        var rateString: String? {
            guard let rate else { return nil }
            return "\(rate)"
        }
    }

}
