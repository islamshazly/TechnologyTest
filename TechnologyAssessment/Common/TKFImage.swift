//
//  TKFImage.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import Kingfisher
import SwiftUI

struct TKFImage: View {
    
    let url: URL?
    
    var body: some View {
        KFImage.init(url).resizable().scaledToFill()
    }
}

