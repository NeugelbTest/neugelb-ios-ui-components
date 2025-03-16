import NeugelbColors
import NeugelbImages
import SwiftUI

public struct NeugelbLoadingView {
    
    public init() {}
}

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
