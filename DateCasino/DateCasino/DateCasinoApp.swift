//
//  DateCasinoApp.swift
//  DateCasino
//
//  Created by Giuseppe Olivari on 19/02/24.
//

import SwiftUI

@main
struct DateCasinoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
