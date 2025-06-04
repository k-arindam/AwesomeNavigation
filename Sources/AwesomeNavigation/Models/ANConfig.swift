//
//  ANConfig.swift
//  AwesomeNavigation
//
//  Created by Arindam Karmakar on 04/06/25.
//

import SwiftUI

/// A configuration structure for setting up an `AwesomeNavigation`-powered application.
///
/// This struct defines the initial settings required for the app, including:
/// - The initial route.
/// - A closure to construct views based on routes.
///
/// - Generics:
///   - `Child`: A SwiftUI `View` that represents the root view of a route.
///   - `Route`: A type representing possible navigation routes in the app.
public struct ANConfig<Child, Route> where Child: View, Route: ANRoute {
    public init(initialRoute: Route, animation: Animation = .easeInOut, @ViewBuilder routeBuilder: @escaping (Route) -> Child) {
        self.initialRoute = initialRoute
        self.animation = animation
        self.routeBuilder = routeBuilder
    }
    
    /// The initial route that the application should navigate to on launch.
    let initialRoute: Route
    
    let animation: Animation
    
    /// A closure that builds the corresponding view for a given route.
    ///
    /// - Parameter route: The navigation route.
    /// - Returns: A SwiftUI `View` associated with the given route.
    @ViewBuilder
    let routeBuilder: (Route) -> Child
}
