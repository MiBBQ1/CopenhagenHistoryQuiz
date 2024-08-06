import UIKit

enum FontStrings: String {
    case InikaBold = "Inika-Bold"
    case InikaRegular = "Inika-Regular"
}


extension UIFont {
    static func InikaRegular(ofSize: CGFloat) -> UIFont {
        return UIFont(name: FontStrings.InikaRegular.rawValue, size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    static func InikaBold(ofSize: CGFloat) -> UIFont {
        return UIFont(name: FontStrings.InikaBold.rawValue, size: ofSize) ?? UIFont.boldSystemFont(ofSize: ofSize)
    }
}

