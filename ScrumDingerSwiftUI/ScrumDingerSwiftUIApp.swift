//
//  ScrumDingerSwiftUIApp.swift
//  ScrumDingerSwiftUI
//
//  Created by Aleksandr Eliseev on 14.01.2023.
//

import SwiftUI

@main
struct ScrumDingerSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
