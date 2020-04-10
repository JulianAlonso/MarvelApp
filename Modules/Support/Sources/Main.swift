import Foundation

public func main(_ work: @escaping () -> Void) {
    Thread.isMainThread ? work() : DispatchQueue.main.async(execute: work)
}
