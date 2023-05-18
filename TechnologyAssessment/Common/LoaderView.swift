//
//  LoaderView.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import SwiftUI

struct LoaderView: View {

    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(1)
    }
}
