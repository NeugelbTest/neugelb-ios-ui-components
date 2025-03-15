import SwiftUI
import NeugelbImages

struct NeugelbSpinnerView: View {

    // MARK: - Properties

    let size: CGFloat
    let animationDuration: Double
    let apearDelayTime: Double

    // MARK: - Initialization

    public init(
        size: CGFloat = 40,
        animationDuration: Double = 2,
        apearDelayTime: Double = 0.5
    ) {
        self.size = size
        self.animationDuration = animationDuration
        self.apearDelayTime = apearDelayTime
    }

    @State private var isVisible = false
    @State private var isAnimating = false

    var body: some View {
        NeugelbImage(
            ImageAsset.loading.image,
            size: size
        )
        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
        .animation(
            Animation.linear(duration: animationDuration)
                .repeatForever(autoreverses: false),
            value: isAnimating
        )
        .opacity(isVisible ? 1 : 0)
        .onAppear {
            isAnimating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + apearDelayTime) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isVisible = true
                }
            }
        }
    }
}

#Preview {
    NeugelbSpinnerView()
}
