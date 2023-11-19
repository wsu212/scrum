//
//  Theme.swift
//  Scrumdinger
//
//  Created by 蘇偉綸 on 2023/11/14.
//

import SwiftUI

enum Theme: String {
    case cyan
    case orange
    case purple
    case yellow
    
    var accentColor: Color {
        switch self {
        case .orange, .yellow: return .white
        case .purple, .cyan: return .black
        }
    }

    var mainColor: Color {
        switch self {
        case .orange: return .orange
        case .yellow: return .yellow
        case .purple: return .purple
        case .cyan: return .cyan
        }
    }

    var name: String {
        rawValue.capitalized
    }
}
