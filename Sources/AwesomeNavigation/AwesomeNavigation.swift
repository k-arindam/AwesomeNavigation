// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  AwesomeNavigation.swift
//  AwesomeNavigation
//
//  Created by Arindam Karmakar on 03/06/25.
//

import SwiftUI

@MainActor
public final class AwesomeNavigation: ObservableObject {
    /// Private initializer to enforce singleton pattern.
    private init() {}
    
    /// Shared instance of `AwesomeNavigation`, ensuring a single instance is used across the app.
    public static let shared = AwesomeNavigation()
    
    /// Stack maintaining the navigation history.
    @Published internal var routeStack = NavigationPath()
    
    /// Stores the initial route of the navigation flow.
    @Published internal var initialRoute: (any ANRoute)? = nil
    
    /// Pops a specified number of routes from the navigation stack.
    /// - Parameter count: The number of routes to remove.
    private func pop(count: Int) -> Void {
        if !self.routeStack.isEmpty {
            self.routeStack.removeLast(count)
        }
    }
    
    /// Pushes a new route onto the navigation stack asynchronously.
    /// - Parameter route: The route to be added, conforming to `ANRoute`.
    public func push<R>(_ route: R) -> Void where R: ANRoute {
        self.routeStack.append(route)
    }
    
    /// Replaces the current route with a new one.
    /// - Parameter route: The new route to be added, conforming to `ANRoute`.
    public func pushReplacement<R>(_ route: R) -> Void where R: ANRoute {
        if self.routeStack.count > 0 {
            self.pop(count: 1)
            self.push(route)
        } else {
            self.updateRoot(with: route)
        }
    }
    
    /// Pops the topmost route from the navigation stack.
    public func pop() -> Void {
        self.pop(count: 1)
    }
    
    /// Pops all routes and navigates back to the root.
    public func popToRoot() -> Void {
        self.pop(count: self.routeStack.count)
    }
    
    /// Replaces the root of the navigation stack with a new route.
    /// - Parameter route: The new root route, conforming to `ANRoute`.
    public func updateRoot<R>(with route: R) -> Void where R: ANRoute {
        self.initialRoute = route
    }
}
