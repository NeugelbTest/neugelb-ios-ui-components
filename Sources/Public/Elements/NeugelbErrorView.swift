import NeugelbColors
import NeugelbImages
import SwiftUI

public struct NeugelbErrorView {

    // MARK: - Properties

    public let error: String

    // MARK: - Initialization

    public init(error: String) {
        self.error = error
    }

}

// MARK: - View

extension NeugelbErrorView: View {

    public var body: some View {
        
        VStack(alignment: .center){
            Spacer()
            
            NeugelbImage(
                ImageAsset.alert,
                size: .size24)
            .padding(.bottom, .spacing8)

            NeugelbText(
                text: error,
                weight: .regular,
                size: 14,
                textColor: .grey10,
                alignment: .center
            )
            .multilineTextAlignment(.center)
            .fillWidth(with: .center)
            
            Spacer()
        }
        .fillWidth()
    }

}

// MARK: - Preview

#Preview {
    NeugelbErrorView(error: "sorry, the movie is not available right now.")
        .prepareForPreview()
}
