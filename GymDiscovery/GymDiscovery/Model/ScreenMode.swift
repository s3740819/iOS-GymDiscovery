//
//  ScreenMode.swift
//  GymDiscovery
//
//  Created by Cục cứt thúi on 02/08/2022.
//

import Foundation
import SwiftUI

struct ColorField {
    var text: Color
    var background: Color
    var map: ColorScheme
}

struct ScreenMode {
    static var dark = ColorField(text: Color.white, background: Color.black, map: .dark)
    static var light = ColorField(text: Color.black, background: Color.white, map: .light)
}
