//
//  PokemonMarketplaceAppApp.swift
//  PokemonMarketplaceApp
//
//  Created by Muhammad Osama Naeem on 1/21/22.
//

import SwiftUI

@main
struct PokemonMarketplaceAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            UserFlowModeratorView()
        }
    }
}
