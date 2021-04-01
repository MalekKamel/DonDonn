// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  internal typealias AssetColorTypeAlias = NSColor
  internal typealias AssetImageTypeAlias = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  internal typealias AssetColorTypeAlias = UIColor
  internal typealias AssetImageTypeAlias = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let grayColor = ColorAsset(name: "GrayColor")
    internal static let filter = ImageAsset(name: "filter")
    internal static let like = ImageAsset(name: "like")
    internal static let likeFill = ImageAsset(name: "like_fill")
    internal static let menu = ImageAsset(name: "menu")
    internal static let notifications = ImageAsset(name: "notifications")
    internal static let search = ImageAsset(name: "search")
    internal static let serving = ImageAsset(name: "serving")
    internal static let star = ImageAsset(name: "star")
    internal static let time = ImageAsset(name: "time")
    internal static let freshRecipe1 = ImageAsset(name: "fresh_recipe_1")
    internal static let freshRecipe2 = ImageAsset(name: "fresh_recipe_2")
    internal static let reco1 = ImageAsset(name: "reco_1")
    internal static let reco2 = ImageAsset(name: "reco_2")
    internal static let reco3 = ImageAsset(name: "reco_3")
    internal static let lightGrayColor = ColorAsset(name: "LightGrayColor")
    internal static let primaryColor = ColorAsset(name: "PrimaryColor")
    internal static let secondaryColor = ColorAsset(name: "SecondaryColor")
    internal static let textColor = ColorAsset(name: "TextColor")
  }
  internal enum Colors {
    internal static let blackDark = ColorAsset(name: "BlackDark")
    internal static let blackLight = ColorAsset(name: "BlackLight")
    internal static let blue = ColorAsset(name: "Blue")
    internal static let darkCloud = ColorAsset(name: "DarkCloud")
    internal static let gray = ColorAsset(name: "Gray")
    internal static let grayLight = ColorAsset(name: "GrayLight")
    internal static let green = ColorAsset(name: "Green")
    internal static let greenLight = ColorAsset(name: "GreenLight")
    internal static let orange = ColorAsset(name: "Orange")
    internal static let orangeLight = ColorAsset(name: "OrangeLight")
    internal static let pink = ColorAsset(name: "Pink")
    internal static let redDark = ColorAsset(name: "RedDark")
    internal static let redLight = ColorAsset(name: "RedLight")
    internal static let white = ColorAsset(name: "White")
    internal static let whiteDark = ColorAsset(name: "WhiteDark")
    internal static let yellow = ColorAsset(name: "Yellow")
    internal static let yellowLight = ColorAsset(name: "YellowLight")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ColorAsset {
  internal fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  internal var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

internal extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct DataAsset {
  internal fileprivate(set) var name: String

  #if os(iOS) || os(tvOS) || os(OSX)
  @available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
  internal var data: NSDataAsset {
    return NSDataAsset(asset: self)
  }
  #endif
}

#if os(iOS) || os(tvOS) || os(OSX)
@available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
internal extension NSDataAsset {
  convenience init!(asset: DataAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(name: asset.name, bundle: bundle)
    #elseif os(OSX)
    self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
    #endif
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  internal var image: AssetImageTypeAlias {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = AssetImageTypeAlias(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = AssetImageTypeAlias(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

internal extension AssetImageTypeAlias {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
