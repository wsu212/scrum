//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 蘇偉綸 on 2023/11/13.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
