import NeugelbColors
import NeugelbImages
import SwiftUI

public struct NeugelbImageView : View {
    
    @Binding
    var image: ImageStatus
    
    public init(image: Binding<ImageStatus>) {
        self._image = image
    }
    
    public var body: some View {
        
        switch image {
        case .failed:
            ImageAsset.imagePlaceholder.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        case .loading:
            ImageAsset.imageLoading.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
        case .success(let image):
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
                
        }
    }
}

// MARK: - Preview

#Preview {

    @State
    var loading = ImageStatus.loading
    
    @State
    var failed = ImageStatus.failed
    
    VStack {
        NeugelbImageView(image: $failed)
            .fillWidth()
            .frame(height: 200)
            .clipped()
        
        NeugelbImageView(image: $loading)
            .fillWidth()
            .frame(height: 200)
            .clipped()
        
        NeugelbImageView(image: $loading)
            .fillWidth()
            .frame(height: 200)
            .clipped()
    }
    .prepareForPreview()
}
