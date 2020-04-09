import Foundation

public func main(_ work: @escaping () -> Void) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async {
            work()
        }
    }
}
