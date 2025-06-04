//
//  ANApplication.swift
//  AwesomeNavigation
//
//  Created by Arindam Karmakar on 03/06/25.
//

import SwiftUI

/// A generic struct representing an `AwesomeNavigation` application.
///
/// This struct acts as the entry point for an `AwesomeNavigation`-powered app, configuring its routing
/// based on the provided `ANConfig`.
///
/// - Conforms to:
///   - `View`: Defines the necessary structure for an `AwesomeNavigation`-based application.
/// - Generics:
///   - `Child`: A SwiftUI `View` that represents the main UI for each route.
///   - `Route`: A type conforming to `ANRoute`, representing possible navigation paths in the app.
public struct ANApplication<Child, Route>: View where Child: View, Route: ANRoute {
    public typealias Config = ANConfig<Child, Route>
    
    /// Initializes an `ANApplication` with the provided configuration.
    ///
    /// - Parameter config: An instance of `ANConfig` that defines the application's routing settings.
    public init(with config: Config) {
        self.config = config
    }
    
    /// Observed instance of `AwesomeNavigation` (singleton), used for managing the route stack.
    @ObservedObject internal var navigation = AwesomeNavigation.shared
    
    /// The configuration settings for the application.
    let config: Config
    
    /// The body of the `ANApplication` view, which contains the navigation stack and route handling logic.
    public var body: some View {
        NavigationStack(path: $navigation.routeStack) {
            let builder = config.routeBuilder
            
            VStack {
                // Display the initial route or a fallback message if no initial route is set.
                if let initialRoute = navigation.initialRoute as? Route {
                    builder(initialRoute)
                } else {
                    Text("No initial route set!")
                }
            }
            .padding(0.0)
            .animation(config.animation)
            // Define navigation destinations for `Route` types, using the provided `routeBuilder` closure.
            .navigationDestination(for: Route.self, destination: builder)
        }
        .environmentObject(navigation)
        // Set up on view appearance (e.g., initialize route).
        .task { navigation.initialRoute = config.initialRoute }
    }
}
