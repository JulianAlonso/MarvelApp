import Foundation

public protocol Runnable {}

public extension Runnable {
    @inlinable
    func run<T>(_ work: (inout Self) -> T) -> T {
        var copy = self
        return work(&copy)
    }

    @inlinable
    func run(_ work: (inout Self) -> Void) -> Self {
        var copy = self
        work(&copy)
        return copy
    }
}
