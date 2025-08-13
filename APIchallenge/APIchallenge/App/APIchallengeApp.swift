//
//  APIchallengeApp.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 13/08/25.
//

import SwiftUI
import SwiftData

@main
struct APIchallengeApp: App {

    var body: some Scene {
        WindowGroup {
            TestView(viewModel: ViewModel(service: Service()))
        }
    }
}
