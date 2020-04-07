import ProjectDescription

extension Project {
    public static func library(name: String, platform: Platform, dependencies: [TargetDependency] = []) -> Project {
        return project(name: name,
                       product: .staticLibrary,
                       platform: platform,
                       dependencies: dependencies,
                       infoPlist: .default)
    }

    private static func project(name: String,
                                product: Product,
                                platform: Platform,
                                dependencies: [TargetDependency] = [],
                                infoPlist: InfoPlist) -> Project {
        return Project(name: name,
                       targets: [
                           Target(name: name,
                                  platform: platform,
                                  product: product,
                                  bundleId: "com.julian.\(name)",
                                  deploymentTarget: .defaultDeployment,
                                  infoPlist: infoPlist,
                                  sources: ["Sources/**"],
                                  dependencies: dependencies),
                           Target(name: "\(name)UnitTests",
                                  platform: platform,
                                  product: .unitTests,
                                  bundleId: "com.julian.\(name)Tests",
                                  deploymentTarget: .defaultDeployment,
                                  infoPlist: .default,
                                  sources: "Tests/**",
                                  dependencies: [
                                      .target(name: "\(name)"),
                                      .nimble,
                                      .httpStubs
                                  ])
                       ])
    }
}
