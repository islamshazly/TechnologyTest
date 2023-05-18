//
//  View+Extension.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import SwiftUI

extension View {

    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = true) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
