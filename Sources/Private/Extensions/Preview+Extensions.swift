import NeugelbColors
import NeugelbFonts
import SwiftUI

enum PreviewAsset {

    static var tapAction: ButtonActionHandler {{ print("Tapped") }}
    static var textHandler: ((String) -> Void) {{ _ in }}

    static var asyncTapAction: ButtonAsyncActionHandler {{
        try? await Task.sleep(nanoseconds: 3000000000)
        print("Tapped")
    }}

    static var loremIpsum: String {
        // swiftlint:disable:next line_length
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumsan tempus iaculis. Cras a eleifend ex. Sed cursus aliquam ante. Praesent volutpat ullamcorper risus ut rhoncus. Quisque quis lobortis mi, a eleifend enim. Cras malesuada turpis eu mauris euismod, at interdum felis cursus. Morbi varius facilisis metus, id fermentum urna. Curabitur lorem lectus, congue eu tristique quis, placerat sed est."
    }

    static let movieListItemModel = MovieListItem.Model.Builder()
        .with(id: 123456789)
        .with(title: "Spiderman")
        .with(imageUrl: "")
        .with(rate: 9.5)
        .with(overview: loremIpsum)
        .with(releaseDate: Date())
        .with(language: "en")
        .build()

}

extension View {

    func prepareForPreview(
        backgroundColor backgroundColorAsset: ColorAsset? = .grey90
    ) -> some View {
        ZStack {
            backgroundColorAsset?.color.ignoresSafeArea()
            self
        }
        .onLoad {
            NeugelbFonts.configureFonts()
        }
    }

}
