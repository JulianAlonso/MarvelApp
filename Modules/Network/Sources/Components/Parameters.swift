import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterConvertible {
    func asParameters() -> Parameters
}

extension Dictionary: ParameterConvertible where Key == String {
    public func asParameters() -> Parameters {
        return self
    }
}

public extension ParameterConvertible where Self: Encodable {
    func asParameters() -> Parameters {
        do {
            let data = try JSONEncoder().encode(self)
            guard let params = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Parameters else {
                fatalError("Not supported type of parameters")
            }
            return params
        } catch {
            fatalError("Parameter convertible encoding error")
        }
    }
}
