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
public enum CompUIAsset {
  public static let blue = CompUIColors(name: "Blue")
  public static let darkGray = CompUIColors(name: "DarkGray")
  public static let gray1 = CompUIColors(name: "Gray1")
  public static let gray2 = CompUIColors(name: "Gray2")
  public static let gray3 = CompUIColors(name: "Gray3")
  public static let red = CompUIColors(name: "Red")
  public static let icBoardBlack = CompUIImages(name: "ic_board_black")
  public static let icBoardWhite = CompUIImages(name: "ic_board_white")
  public static let icCompWhite = CompUIImages(name: "ic_comp_white")
  public static let icDividerWhite = CompUIImages(name: "ic_divider_white")
  public static let icGridWhite = CompUIImages(name: "ic_grid_white")
  public static let icHorizontalWhite = CompUIImages(name: "ic_horizontal_white")
  public static let icImageBlack = CompUIImages(name: "ic_image_black")
  public static let icImageWhite = CompUIImages(name: "ic_image_white")
  public static let icPlusWhite = CompUIImages(name: "ic_plus_white")
  public static let icPositionCenterWhite = CompUIImages(name: "ic_position_center_white")
  public static let icPositionLeftWhite = CompUIImages(name: "ic_position_left_white")
  public static let icPositionRightWhite = CompUIImages(name: "ic_position_right_white")
  public static let icSectorWhite = CompUIImages(name: "ic_sector_white")
  public static let icSectorWhite30 = CompUIImages(name: "ic_sector_white_30")
  public static let icSpaceBlack = CompUIImages(name: "ic_space_black")
  public static let icSpaceWhite = CompUIImages(name: "ic_space_white")
  public static let icTextDividerWhite = CompUIImages(name: "ic_textDivider_white")
  public static let icTextBlack = CompUIImages(name: "ic_text_black")
  public static let icTextWhite = CompUIImages(name: "ic_text_white")
  public static let plusCircleBlack = CompUIImages(name: "plus_circle_black")
  public static let plusCircleWhite = CompUIImages(name: "plus_circle_white")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class CompUIColors {
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

public extension CompUIColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: CompUIColors) {
    let bundle = CompUIResources.bundle
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
  init(asset: CompUIColors) {
    let bundle = CompUIResources.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct CompUIImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = CompUIResources.bundle
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

public extension CompUIImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the CompUIImages.image property")
  convenience init?(asset: CompUIImages) {
    #if os(iOS) || os(tvOS)
    let bundle = CompUIResources.bundle
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
  init(asset: CompUIImages) {
    let bundle = CompUIResources.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: CompUIImages, label: Text) {
    let bundle = CompUIResources.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: CompUIImages) {
    let bundle = CompUIResources.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all
