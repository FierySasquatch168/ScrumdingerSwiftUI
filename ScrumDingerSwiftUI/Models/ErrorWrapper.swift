//
//  ErrorWrapper.swift
//  ScrumDingerSwiftUI
//
//  Created by Aleksandr Eliseev on 16.01.2023.
//

import Foundation

struct ErrorWrapper: Identifiable {
    var id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
