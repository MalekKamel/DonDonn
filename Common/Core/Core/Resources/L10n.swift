// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum L10n {
  /// Adolphin
  public static let adolphin = L10n.tr("Localizable", "adolphin")
  /// Adolphin
  public static let appName = L10n.tr("Localizable", "app_name")
  /// available
  public static let available = L10n.tr("Localizable", "available")
  /// Cannot be less than
  public static let canNotBeLessThan = L10n.tr("Localizable", "can_not_be_less_than")
  /// Cannot be more than
  public static let canNotBeMoreThan = L10n.tr("Localizable", "can_not_be_more_than")
  /// Cancel
  public static let cancel = L10n.tr("Localizable", "cancel")
  /// Cash In/Out
  public static let cashInOut = L10n.tr("Localizable", "cash_in_out")
  /// Categories
  public static let categories = L10n.tr("Localizable", "categories")
  /// Choose between multiple POS modules here:
  public static let chooseBetweenMultipleModules = L10n.tr("Localizable", "choose_between_multiple_modules")
  /// Discount
  public static let discount = L10n.tr("Localizable", "discount")
  /// Email
  public static let email = L10n.tr("Localizable", "email")
  /// Forgot Password?
  public static let forgotPassword = L10n.tr("Localizable", "forgot_password")
  /// Hints
  public static let hints = L10n.tr("Localizable", "hints")
  /// Hold Orders
  public static let holdOrders = L10n.tr("Localizable", "hold_orders")
  /// Home
  public static let home = L10n.tr("Localizable", "home")
  /// Invalid
  public static let invalid = L10n.tr("Localizable", "Invalid")
  /// Invalid email address
  public static let invalidEMailAddress = L10n.tr("Localizable", "Invalid e-mail Address")
  /// Keep me signed in
  public static let keepMeSigned = L10n.tr("Localizable", "keep_me_signed")
  /// Lock
  public static let lock = L10n.tr("Localizable", "lock")
  /// Manage Products
  public static let manageProducts = L10n.tr("Localizable", "manage_products")
  /// Must be
  public static let mustBe = L10n.tr("Localizable", "must_be")
  /// Not matching
  public static let notMatching = L10n.tr("Localizable", "not_matching")
  /// Online
  public static let online = L10n.tr("Localizable", "online")
  /// OOPS! something went wrong, please try again.
  public static let oopsSomethingWentWrong = L10n.tr("Localizable", "OOPS! something went wrong")
  /// Order No
  public static let orderNo = L10n.tr("Localizable", "order_no")
  /// Password
  public static let password = L10n.tr("Localizable", "password")
  /// Proceed
  public static let proceed = L10n.tr("Localizable", "proceed")
  /// Product
  public static let product = L10n.tr("Localizable", "product")
  /// Register Now
  public static let registerNow = L10n.tr("Localizable", "register_now")
  /// Required
  public static let `required` = L10n.tr("Localizable", "Required")
  /// SAR
  public static let sar = L10n.tr("Localizable", "sar")
  /// Sign In
  public static let signIn = L10n.tr("Localizable", "sign_in")
  /// Subtotal
  public static let subtotal = L10n.tr("Localizable", "subtotal")
  /// Tax
  public static let tax = L10n.tr("Localizable", "tax")
  /// Total
  public static let total = L10n.tr("Localizable", "total")
  /// Transactions
  public static let transactions = L10n.tr("Localizable", "transactions")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
