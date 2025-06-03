//
//  ANRoute.swift
//  AwesomeNavigation
//
//  Created by Arindam Karmakar on 03/06/25.
//

import Foundation

/// A protocol representing a navigable route within the app.
/// - Conforms to `Hashable` and `Codable`.
/// - Conforms to `Sendable`, ensuring thread safety when used in concurrent environments.
public protocol ANRoute: Hashable, Codable, Sendable {}
