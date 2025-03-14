import NeugelbColors
import NeugelbImages
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

                VStack(alignment: .leading, spacing: .spacing4) {
                    titleView
                        .padding(.top, .spacing4)

                    Spacer()

                    informationView(image: ImageAsset.star, title: model.rateString)
                    informationView(image: ImageAsset.calendar, title: model.releaseDate)
                    informationView(image: ImageAsset.ticket, title: model.language)
                        .padding(.bottom, .spacing8)
                }
            }
            .fillWidth()
        }
        .onAppear(perform: {
            Task {
                image = await model.fetchImage()
            }
        })
    }

    @ViewBuilder
    private func informationView(image: ImageAsset.Asset, title: String?, color: ColorAsset = .grey10) -> some View {
        if let title {
            HStack {
                image.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: Constant.iconSize, height: Constant.iconSize)
                NeugelbText(
                    text: title,
                    size: 12,
                    textColor: color
                )
            }
        }
    }

    private var titleView: some View {
        NeugelbText(
            text: model.title ?? "Untitle",
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
