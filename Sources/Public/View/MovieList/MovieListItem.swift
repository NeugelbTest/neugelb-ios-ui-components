import NeugelbColors
import NeugelbImages
import NeugelbLocalized
import SwiftUI

public struct MovieListItem {

    // MARK: - Properties

    @State var model: Model
    @State var image: ImageStatus = .loading

    // MARK: - Initialization

    public init(model: Model) {
        self.model = model
    }

}

// MARK: - View

extension MovieListItem: View {

    public var body: some View {
        Button(action: {
            model.detailButtonActionHandler?(model.id)
        }) {
            HStack(alignment: .top, spacing: .spacing12) {
                NeugelbImageView(image: $image)
                    .frame(
                        width: Constant.imageWidth,
                        height: Constant.imageHeight
                    )
                    .clipped()
                    .cornerRadius(16)

                VStack(alignment: .leading, spacing: .spacing8) {
                    titleView
                        .padding(.top, .spacing4)

                    Spacer()
                    
                    if let rate = model.rateString {
                        NeugelbQuickInfo(model: .star, value: rate)
                    }
                    if let releaseDate = model.releaseDate {
                        NeugelbQuickInfo(model: .calendar, value: releaseDate)
                    }
                    if let language = model.language {
                        NeugelbQuickInfo(model: .ticket, value: language)
                    }
                }
                .padding(.bottom, .spacing8)
            }
            .fillWidth()
        }
        .onAppear(perform: {
            Task {
                image = await model.fetchImage()
            }
        })
    }

    private var titleView: some View {
        NeugelbText(
            text: model.title ?? Localizable.untitle,
            size: 16,
            textColor: .grey10
        )
    }

}

// MARK: - Constants

private extension MovieListItem {

    enum Constant {

        static let imageWidth: CGFloat = 96
        static let imageHeight: CGFloat = 120
        static let iconSize: CGFloat = 16
    }

}

// MARK: - Preview

#Preview {
    ScrollView {
        VStack(spacing: .spacing8) {

            MovieListItem(model: PreviewAsset.movieListItemModel)
            MovieListItem(model: PreviewAsset.movieListItemModel)
            MovieListItem(model: PreviewAsset.movieListItemModel)
            MovieListItem(model: PreviewAsset.movieListItemModel)
        }
    }
    .prepareForPreview()
}
