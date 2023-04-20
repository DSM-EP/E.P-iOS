import UIKit

extension UIFont {
    enum Family: String {
        case regular = "Regular"
        case medium = "Medium"
        case bold = "Bold"
    }
    enum Alone: String {
        case regular = "Regular"
    }

    static func notoSansFont(ofSize: CGFloat, family: Family) -> UIFont {
        return UIFont(name: "NotoSansKR-\(family.rawValue)", size: ofSize)!
    }
    static func niconneFont(ofSize: CGFloat, alone: Alone) -> UIFont {
        return UIFont(name: "Niconne-\(alone.rawValue)", size: ofSize)!
    }
}
