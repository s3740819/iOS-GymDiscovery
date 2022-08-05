/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2022B
    Assessment: Assignment 1
    Author: Tran Kim Bao
    ID: s3740819
    Created Date: 01/08/2022
    Last Modified: 05/08/2022
    Acknowledgement:
        - Google Map: For Coordinate Checking
        - https://saigonkisstours.com/recommended-gyms-in-ho-chi-minh/
 */


import SwiftUI

struct ColorThemes {
    static let redlight = Color(red: 0.96, green: 0.53, blue: 0.53)
    static var darkgreen = Color(red: 0.043, green: 0.467, blue: 0.494)

    static func burblesTopLeft(isDark: Bool) -> Color {
        let others = Color(red: 0.039, green: 0.388, blue: 0.502, opacity: 0.81)
        let dark = Color(red: 0.000, green: 0.176, blue: 0.216, opacity: 80.0)
        
        return isDark ? dark : others
    }

    static func burblesTopRight(isDark: Bool) -> Color {
        let others = Color(red: 0.196, green: 0.796, blue: 0.329, opacity: 0.5)
        let dark = Color(red: 0.408, green: 0.698, blue: 0.420, opacity: 0.61)

        return isDark ? dark : others
    }

    static func burblesBottomLeft(isDark: Bool) -> Color {
        return Color(red: 0.541, green: 0.733, blue: 0.812, opacity: 0.7)
    }

    static func burblesBottomRight(isDark: Bool) -> Color {
        let others = Color(red: 0.196, green: 0.749, blue: 0.486, opacity: 0.55)
        let dark = Color(red: 0.525, green: 0.859, blue: 0.655, opacity: 0.45)
        
        return isDark ? dark : others
    }
}
