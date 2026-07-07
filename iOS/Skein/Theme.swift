import SwiftUI

enum Theme {
    static let accent = Color(red: 0.62,0.24,0.45)
    static let accent2 = Color(red: 0.90,0.75,0.35)
    static let background = Color(red: 0.08,0.05,0.07)

    static let largeTitle = Font.system(.largeTitle, design: .serif).weight(.bold)
    static let headline = Font.system(.headline, design: .rounded)
    static let body = Font.system(.body, design: .default)
    static let caption = Font.system(.caption, design: .rounded)

    static let cornerRadius: CGFloat = 14
}
