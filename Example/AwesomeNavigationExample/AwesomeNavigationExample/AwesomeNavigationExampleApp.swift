//
//  AwesomeNavigationExampleApp.swift
//  AwesomeNavigationExample
//
//  Created by Arindam Karmakar on 05/06/25.
//

import SwiftUI
import AwesomeNavigation

@main
struct AwesomeNavigationExampleApp: App {
    var body: some Scene {
        WindowGroup {
            let config = ANConfig(initialRoute: AppRoute.home) { route in
                switch route {
                case .home:
                    HomeView()
                case .settings:
                    SettingsView()
                case .item(let id):
                    ItemView(id: id)
                }
            }
            
            ANApplication(with: config)
                .preferredColorScheme(.dark)
        }
    }
}

enum AppRoute: ANRoute {
    case home
    case settings
    case item(id: String)
}

struct HomeView: View {
    @EnvironmentObject var nav: AwesomeNavigation
    
    var body: some View {
        List {
            Section("PUSH") {
                Button("Push Settings View") {
                    nav.push(AppRoute.settings)
                }
                
                Button("Push Home View") {
                    nav.push(AppRoute.home)
                }
                
                Button("Push Item View") {
                    nav.push(AppRoute.item(id: UUID().uuidString))
                }
                
                Button("Push Settings View Replacing Current View") {
                    nav.pushReplacement(AppRoute.settings)
                }
            }
            
            Section("POP") {
                Button("Pop One View") {
                    nav.pop()
                }
                
                Button("Pop All Views") {
                    nav.popToRoot()
                }
            }
        }
        .navigationTitle("Home")
    }
}

struct SettingsView: View {
    @EnvironmentObject var nav: AwesomeNavigation
    
    var body: some View {
        List {
            Section("PUSH") {
                Button("Push Home View Replacing Current View") {
                    nav.pushReplacement(AppRoute.home)
                }
            }
            
            Section("POP") {
                Button("Pop One View") {
                    nav.pop()
                }
                
                Button("Pop All Views") {
                    nav.popToRoot()
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct ItemView: View {
    let id: String
    
    var body: some View {
        VStack {
            Text("Item ID: \(id)")
        }
        .padding()
        .navigationTitle("Item")
    }
}
