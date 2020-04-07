import ProjectDescription

public extension TargetDependency {
    // Modules
    static let core: TargetDependency = .project(target: "Core", path: .relativeToRoot("Modules/Core"))
    static let displayKit: TargetDependency = .project(target: "DisplayKit", path: .relativeToRoot("Modules/DisplayKit"))
    static let marvelAPI: TargetDependency = .project(target: "MarvelAPI", path: .relativeToRoot("Modules/MarvelAPI"))
    static let network: TargetDependency = .project(target: "Network", path: .relativeToRoot("Modules/Network"))
    static let support: TargetDependency = .project(target: "Support", path: .relativeToRoot("Modules/Support"))

    // Carthage
    static let injection: TargetDependency = .framework(path: .carthage("Injection"))
    static let nimble: TargetDependency = .framework(path: .carthage("Nimble"))
    static let httpStubs: TargetDependency = .framework(path: .carthage("OHHTTPStubs"))
}

extension Path {
    private static let FrameworksRoot = "Carthage/Build/iOS"

    static func carthage(_ name: String) -> Path {
        .relativeToRoot("\(FrameworksRoot)/\(name).framework")
    }
}
