// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@MainActor
public class RouterPath: ObservableObject {
    @Published public var path: [RouterDestination] = []
    public init() {}
    public func navigate(to: RouterDestination) {
      path.append(to)
    }
}
    
public enum RouterDestination: Hashable {
    case homeDetail(id: String)
    case meDetail(id: String)
}
