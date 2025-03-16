import NeugelbColors
import NeugelbImages
import SwiftUI

public struct NeugelbLoadingView {}

// MARK: - View

extension NeugelbLoadingView: View {

    public var body: some View {
        VStack(alignment: .leading, spacing: .zero) {

            Spacer()
            NeugelbSpinnerView()
            Spacer()
        }
    }

}

// MARK: - Preview

#Preview {
    VStack {
        NeugelbLoadingView()
    }
    .prepareForPreview()
}
