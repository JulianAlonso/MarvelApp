import ProjectDescription

extension DeploymentTarget {
    public static let defaultDeployment: DeploymentTarget = .iOS(targetVersion: "13.0", devices: .iphone)
}
