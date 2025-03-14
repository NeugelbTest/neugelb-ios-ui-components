import Foundation
import SwiftUI
import NeugelbNetwork

public extension MovieListItem.Model {

    final class Builder: ModelBuilder {

        // MARK: - Properties

        private(set) var id : String = ""
        private(set) var name: String?
        private(set) var imageUrl: String?
        private(set) var rate: Double?
        private(set) var genre: String?
        private(set) var year: Int?
        private(set) var time: Int?
        private(set) var imageService: ImageService? = nil
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

    func with(name: String) -> Self {
        self.name = name
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
    
    func with(genre: String) -> Self {
        self.genre = genre
        return self
    }
    
    func with(year: Int) -> Self {
        self.year = year
        return self
    }
    
    func with(time: Int?) -> Self {
        self.time = time
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
            name: name,
            imageUrl: imageUrl,
            rate: rate,
            genre: genre,
            year: year,
            time: time,
            imageService: imageService,
            detailButtonActionHandler: detailButtonActionHandler
        )
    }

}

