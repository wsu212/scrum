//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by 蘇偉綸 on 2023/11/14.
//

import SwiftUI

// With the LabelStyle protocol, you can create a consistent design throughout the app by reusing the same label style for several views.
struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
