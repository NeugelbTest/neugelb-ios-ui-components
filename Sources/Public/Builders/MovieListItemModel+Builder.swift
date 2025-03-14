import Foundation
import SwiftUI
import NeugelbNetwork

public extension MovieListItem.Model {

    final class Builder: ModelBuilder {

        // MARK: - Properties

        private(set) var id: String = ""
        private(set) var title: String?
        private(set) var imageUrl: String?
        private(set) var rate: Double?
        private(set) var overview: String?
        private(set) var releaseDate: String?
        private(set) var language: String?
        private(set) var imageService: ImageService?
        private(set) var detailButtonActionHandler: ValueHandler<String>?

        // MARK: - Initialization

        public init() {}
    }

}

// MARK: - Public Methods

public extension MovieListItem.Model.Builder {

    func with(id: String) -> Self {
        self.id = id
        return self
    }

    func with(title: String) -> Self {
        self.title = title
        return self
    }

    func with(imageUrl: String?) -> Self {
        self.imageUrl = imageUrl
        return self
    }

    func with(rate: Double?) -> Self {
        self.rate = rate
        return self
    }

    func with(overview: String) -> Self {
        self.overview = overview
        return self
    }

    func with(releaseDate: Date?) -> Self {
        self.releaseDate = releaseDate?.formattedString()
        return self
    }

    func with(language: String?) -> Self {
        self.language = language
        return self
    }

    func with(imageService: ImageService?) -> Self {
        self.imageService = imageService
        return self
    }

    func with(detailButtonActionHandler: ValueHandler<String>?) -> Self {
        self.detailButtonActionHandler = detailButtonActionHandler
        return self
    }

    func build() -> MovieListItem.Model {
        .init(
            id: id,
            title: title,
            imageUrl: imageUrl,
            rate: rate,
            overview: overview,
            releaseDate: releaseDate,
            language: language,
            imageService: imageService,
            detailButtonActionHandler: detailButtonActionHandler
        )
    }

}
