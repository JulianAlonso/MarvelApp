import Foundation

public protocol Runnable {}

public extension Runnable {
    @inlinable
    func run<T>(_ work: (Self) -> T) -> T {
        return work(self)
    }

    @inlinable
    func run(_ work: (Self) -> Void) -> Self {
        work(self)
        return self
    }
}
