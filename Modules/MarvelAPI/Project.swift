import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.library(name: "MarvelAPI",
                              platform: .iOS,
                              dependencies: [.network, .core])
