//
//  DateCasinoApp.swift
//  DateCasino Watch App
//
//  Created by Giuseppe Olivari on 19/02/24.
//

import SwiftUI
import TipKit

struct CrownTip: Tip{
    var title : Text {
        Text("Use the crown to spin")
            
            
            
        
    }
    
        
}
@main
struct DateCasino_Watch_AppApp: App {
    init() {
        try? Tips.configure()
            
      }
    var body: some Scene {
        WindowGroup {
            ScrollableView1()
        }
    }
}

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
