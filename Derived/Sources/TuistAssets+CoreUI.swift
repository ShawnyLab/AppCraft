// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum CoreUIAsset {
  public static let googleSignin = CoreUIImages(name: "google_signin")
  public static let blue = CoreUIColors(name: "Blue")
  public static let darkGray = CoreUIColors(name: "DarkGray")
  public static let gray1 = CoreUIColors(name: "Gray1")
  public static let gray2 = CoreUIColors(name: "Gray2")
  public static let gray3 = CoreUIColors(name: "Gray3")
  public static let red = CoreUIColors(name: "Red")
  public static let icBoardBlack = CoreUIImages(name: "ic_board_black")
  public static let icBoardWhite = CoreUIImages(name: "ic_board_white")
  public static let icCompWhite = CoreUIImages(name: "ic_comp_white")
  public static let icDividerWhite = CoreUIImages(name: "ic_divider_white")
  public static let icGridWhite = CoreUIImages(name: "ic_grid_white")
  public static let icHorizontalWhite = CoreUIImages(name: "ic_horizontal_white")
  public static let icImageBlack = CoreUIImages(name: "ic_image_black")
  public static let icImageWhite = CoreUIImages(name: "ic_image_white")
  public static let icPlusWhite = CoreUIImages(name: "ic_plus_white")
  public static let icPositionCenterWhite = CoreUIImages(name: "ic_position_center_white")
  public static let icPositionLeftWhite = CoreUIImages(name: "ic_position_left_white")
  public static let icPositionRightWhite = CoreUIImages(name: "ic_position_right_white")
  public static let icSectorWhite = CoreUIImages(name: "ic_sector_white")
  public static let icSectorWhite30 = CoreUIImages(name: "ic_sector_white_30")
  public static let icSpaceBlack = CoreUIImages(name: "ic_space_black")
  public static let icSpaceWhite = CoreUIImages(name: "ic_space_white")
  public static let icTextDividerWhite = CoreUIImages(name: "ic_textDivider_white")
  public static let icTextBlack = CoreUIImages(name: "ic_text_black")
  public static let icTextWhite = CoreUIImages(name: "ic_text_white")
  public static let plusCircleBlack = CoreUIImages(name: "plus_circle_black")
  public static let plusCircleWhite = CoreUIImages(name: "plus_circle_white")
  public static let guideLogo = CoreUIImages(name: "guide_logo")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class CoreUIColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if canImport(SwiftUI)
  private var _swiftUIColor: Any? = nil
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public private(set) var swiftUIColor: SwiftUI.Color {
    get {
      if self._swiftUIColor == nil {
        self._swiftUIColor = SwiftUI.Color(asset: self)
      }

      return self._swiftUIColor as! SwiftUI.Color
    }
    set {
      self._swiftUIColor = newValue
    }
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension CoreUIColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: CoreUIColors) {
    let bundle = CoreUIResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
  init(asset: CoreUIColors) {
    let bundle = CoreUIResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct CoreUIImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = CoreUIResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension CoreUIImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the CoreUIImages.image property")
  convenience init?(asset: CoreUIImages) {
    #if os(iOS) || os(tvOS)
    let bundle = CoreUIResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: CoreUIImages) {
    let bundle = CoreUIResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: CoreUIImages, label: Text) {
    let bundle = CoreUIResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: CoreUIImages) {
    let bundle = CoreUIResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
