import NeugelbColors
import NeugelbImages
import SwiftUI

public struct NeugelbImage {

    // MARK: - Properties

    let image: Image
    let frame: ViewFrame
    let contentMode: ContentMode
    let renderingMode: Image.TemplateRenderingMode?
    let foregroundColor: ColorAsset?

    // MARK: - Initialization

    public init(
        _ image: Image,
        frame: ViewFrame = .init(),
        contentMode: ContentMode = .fit,
        renderingMode: Image.TemplateRenderingMode? = nil,
        foregroundColor: ColorAsset? = nil
    ) {
        self.image = image
        self.frame = frame
        self.contentMode = contentMode
        self.renderingMode = renderingMode
        self.foregroundColor = foregroundColor
    }

    public init(
        _ image: Image,
        size: CGFloat,
        alignment: Alignment = .center,
        contentMode: ContentMode = .fit,
        renderingMode: Image.TemplateRenderingMode? = nil,
        foregroundColor: ColorAsset? = nil
    ) {
        self.init(
            image,
            frame: .init(size: size, alignment: alignment),
            contentMode: contentMode,
            renderingMode: renderingMode,
            foregroundColor: foregroundColor
        )
    }

    public init(
        _ image: UIImage,
        frame: ViewFrame = .init(),
        contentMode: ContentMode = .fit,
        renderingMode: Image.TemplateRenderingMode? = nil,
        foregroundColor: ColorAsset? = nil
    ) {
        self.init(
            Image(uiImage: image),
            frame: frame,
            contentMode: contentMode,
            renderingMode: renderingMode,
            foregroundColor: foregroundColor
        )
    }

    public init(
        _ image: UIImage,
        size: CGFloat,
        alignment: Alignment = .center,
        contentMode: ContentMode = .fit,
        renderingMode: Image.TemplateRenderingMode? = nil,
        foregroundColor: ColorAsset? = nil
    ) {
        self.init(
            image,
            frame: .init(size: size, alignment: alignment),
            contentMode: contentMode,
            renderingMode: renderingMode,
            foregroundColor: foregroundColor
        )
    }

    public init(
        _ imageAsset: ImageAsset.Asset,
        frame: ViewFrame = .init(),
        contentMode: ContentMode = .fit,
        renderingMode: Image.TemplateRenderingMode? = nil,
        foregroundColor: ColorAsset? = nil
    ) {
        self.init(
            imageAsset.image,
            frame: frame,
            contentMode: contentMode,
            renderingMode: renderingMode,
            foregroundColor: foregroundColor
        )
    }

    public init(
        _ imageAsset: ImageAsset.Asset,
        size: CGFloat,
        alignment: Alignment = .center,
        contentMode: ContentMode = .fit,
        renderingMode: Image.TemplateRenderingMode? = nil,
        foregroundColor: ColorAsset? = nil
    ) {
        self.init(
            imageAsset,
            frame: .init(size: size, alignment: alignment),
            contentMode: contentMode,
            renderingMode: renderingMode,
            foregroundColor: foregroundColor
        )
    }

    public init(
        _ image: Image,
        size: ViewSize,
        alignment: Alignment = .center,
        contentMode: ContentMode = .fit,
        renderingMode: Image.TemplateRenderingMode? = nil,
        foregroundColor: ColorAsset? = nil
    ) {
        self.init(
            image,
            frame: .init(size: size.rawValue, alignment: alignment),
            contentMode: contentMode,
            renderingMode: renderingMode,
            foregroundColor: foregroundColor
        )
    }

    public init(
        _ imageAsset: ImageAsset.Asset,
        size: ViewSize,
        alignment: Alignment = .center,
        contentMode: ContentMode = .fit,
        renderingMode: Image.TemplateRenderingMode? = nil,
        foregroundColor: ColorAsset? = nil
    ) {
        self.init(
            imageAsset,
            frame: .init(size: size.rawValue, alignment: alignment),
            contentMode: contentMode,
            renderingMode: renderingMode,
            foregroundColor: foregroundColor
        )
    }

}

// MARK: - View

extension NeugelbImage: View {

    public var body: some View {
        image
            .resizable()
            .renderingMode(renderingMode)
            .aspectRatio(contentMode: contentMode)
            .frame(
                minWidth: frame.minWidth,
                idealWidth: frame.idealWidth,
                maxWidth: frame.maxWidth,
                minHeight: frame.minHeight,
                idealHeight: frame.idealHeight,
                maxHeight: frame.maxHeight,
                alignment: frame.alignment
            )
            .foregroundColor(foregroundColor)
    }

}

// MARK: - Preview

#Preview {
    let size = ViewSize.size24
    let frame = ViewFrame(maxWidth: size.rawValue, maxHeight: size.rawValue)
    func iconView(
        tintedView: Bool,
        tintedImage: Bool
    ) -> some View {
        let image = tintedImage
        ? ImageAsset.close.uiImage(tintColor: ColorAsset.white100.uiColor)
            : ImageAsset.close.uiImage
        let renderingMode = tintedView
            ? Image.TemplateRenderingMode.template
            : nil
        let backgroundColor = tintedView
            ? ColorAsset.red100
            : ColorAsset.grey70
        return ZStack {
            Circle()
                .frame(
                    width: ViewSize.size32.rawValue,
                    height: ViewSize.size32.rawValue
                )
                .foregroundColor(backgroundColor)
                .cornerRadius(ViewSize.size16.rawValue)
            NeugelbImage(
                image,
                size: 16,
                renderingMode: renderingMode,
                foregroundColor: .white100
            )
        }
    }
    return VStack {
        NeugelbImage(ImageAsset.close.uiImage, frame: frame)
        NeugelbImage(ImageAsset.close.uiImage, size: size.rawValue)
        NeugelbImage(ImageAsset.close.image, frame: frame)
        NeugelbImage(ImageAsset.close.image, size: size)
        NeugelbImage(ImageAsset.close, frame: frame)
        NeugelbImage(ImageAsset.close, size: size)

        iconView(tintedView: false, tintedImage: false)
        iconView(tintedView: false, tintedImage: true)
        iconView(tintedView: true, tintedImage: false)
        iconView(tintedView: true, tintedImage: true)
    }
    .prepareForPreview()
}
