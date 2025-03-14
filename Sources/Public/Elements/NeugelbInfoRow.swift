import NeugelbColors
import NeugelbImages
import SwiftUI

public struct NeugelbInfoRow {

    // MARK: - Properties

    let title: String
    let value: String

    // MARK: - Initialization

    public init(
        title: String,
        value: String
    ) {
        self.title = title
        self.value = value
    }

}

// MARK: - View

extension NeugelbInfoRow: View {

    public var body: some View {
        VStack(alignment: .leading, spacing: .zero){
            
            HStack(alignment: .top){
                NeugelbText(
                    text: title + " :",
                    weight: .semibold,
                    size: 16,
                    textColor: .grey40
                )
                .frame(width: 140, alignment: .leading)
                
                
                
                NeugelbText(
                    text: value,
                    size: 16,
                    textColor: .grey60
                )
            }.padding(.vertical, 16)
            
            Divider()
                .frame(height: 1)
                .background(ColorAsset.grey80.color)
        }
        .padding(.horizontal, .spacing16)
    }

}

// MARK: - Preview

#Preview {
    VStack {
        NeugelbInfoRow(title: "Title", value: "Spiderman")
        NeugelbInfoRow(title: "Title", value: "Spiderman")
        NeugelbInfoRow(title: "Title", value: "Spiderman")
        NeugelbInfoRow(title: "Title", value: "Spiderman")
    }
    .prepareForPreview()
}
