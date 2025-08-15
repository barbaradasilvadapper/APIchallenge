//
//  EmptyStateFavorites.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//

import SwiftUI

struct EmptyStateFavorites: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8){
            Image(systemName: "heart.slash")
                .foregroundStyle(.graysGray2)
                .font(.system(size: 48))
                .frame(width: 65, height: 69)
            
            VStack(spacing: 16) {
                Text("No favorites yet")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.labelsPrimary)
                
                Text("Favorite an item and it will show up here.")
                    .font(.body)
                    .foregroundStyle(.labelsSecondary)
            }
        }
    }
}

#Preview {
    EmptyStateFavorites()
}
