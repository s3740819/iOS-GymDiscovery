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

// Color Mapper
struct ColorMapper {
    var text: Color
    var background: Color
    var map: ColorScheme
}

// Screen Mode For Global Usage
struct ScreenMode {
    static var dark = ColorMapper(text: Color.white, background: Color.black, map: .dark)
    static var light = ColorMapper(text: Color.black, background: Color.white, map: .light)
}
