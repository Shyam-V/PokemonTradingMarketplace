//
//  ContentView.swift
//  PokemonMarketplaceApp
//
//  Created by Muhammad Osama Naeem on 1/21/22.
//

import SwiftUI
import Firebase
struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Pokemon Trading Marketplace")
                        .padding()
                    
                    NavigationLink("Register", destination: RegisterView())
                    NavigationLink("Log In", destination: LoginView())
                    
                    Button {
                        do {
                            try Auth.auth().signOut()
                        } catch let signOutError as NSError {
                          print("Error signing out: %@", signOutError)
                        }
                    } label: {
                        Text("Sign Out")
                    }

                }
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
