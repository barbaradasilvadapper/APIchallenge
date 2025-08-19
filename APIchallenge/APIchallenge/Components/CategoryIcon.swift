//
//  ComponentIcon.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 14/08/25.
//

import SwiftUI

struct CategoryIcon: View {
    
    var category: Category
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 8) {
            VStack(alignment: .center) {
                Image(systemName: category.imageName)
                    .font(.system(size: 38))
                    .foregroundStyle(.fillsTertiary)
            }
            .frame(width: 84, height: 84)
            .background(.backgroundsSecondary)
            .cornerRadius(16)
            
            Text(category.stringLocalized.capitalized)
                .font(.subheadline)
                .frame(width: 84)
                .lineLimit(1)
                .truncationMode(.tail)
        }
        
    }
}

#Preview {
    CategoryIcon(category: .beauty)
}
