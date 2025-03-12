import Foundation

protocol ModelBuilder: AnyObject {

    associatedtype Model

    init()

    func build() -> Model

}

extension ModelBuilder {

    init() {
        self.init()
    }

}
