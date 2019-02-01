// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

class Fastfile: LaneFile {
	func testLane() {
        desc("Run Build and Tests")
        cocoapods()
		scan()
	}

    func betaLane() {
        desc("Publish a beta version on Hockey App")
        match(type: "ad-hoc",
              readonly: true)

        gym(scheme: "Cocoaheads",
            clean: true,
            outputDirectory: "beta",
            outputName: "cocoaheads")

        hockey(apiToken: "123456",
               ipa: "./beta/cocoaheads.ipa",
               notes: "Agora é possível escrever suas lanes em Swift. 0/")
    }

    func publishAppStoreLane(withOptions options: [String: String]?) {
        desc("Publish app on App Store")
        incrementBuildNumber(buildNumber: options?["build_number"])
        incrementVersionNumber(versionNumber: options?["version_number"])

        testLane()

        match(type: "app-store",
              readonly: true)

        gym(scheme: "Cocoaheads",
            clean: true,
            outputDirectory: "build",
            outputName: "cocoaheads")

        deliver(username: appleID,
                appIdentifier: appIdentifier,
                ipa: "build/cocoaheads.ipa",
                skipBinaryUpload: true,
                skipScreenshots: true,
                skipMetadata: false,
                submitForReview: false,
                automaticRelease: false,
                phasedRelease: true)
    }

    func lintLane(withOptions options: [String: String]?) {
        desc("Run swift lint")
        swiftlint(mode: "autocorrect")
    }
}
