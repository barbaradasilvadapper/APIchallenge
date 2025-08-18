//
//  EmptyStateCart.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//

import SwiftUI

struct EmptyStateCart: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8){
            Image(systemName: "cart.badge.questionmark")
                .foregroundStyle(.graysGray2)
                .font(.system(size: 48))
                .frame(width: 65, height: 69)
            
            VStack(spacing: 16) {
                Text("Your cart is empty!")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.labelsPrimary)
                
                Text("Add an item to your cart.")
                    .font(.body)
                    .foregroundStyle(.labelsSecondary)
            }
        }
    }

}

#Preview {
    EmptyStateCart()
}
