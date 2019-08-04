// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

class Fastfile: LaneFile {
	func customLane() {
	desc("Description of what the lane does")
		// add actions here: https://docs.fastlane.tools/actions
	}
    
    func testLane() {
        desc("Run Build and Tests")
        scan()
    }
    
    func betaLane() {
        desc("Publish a beta version on Hockey App")
        match(type: "ad-hoc",
              readonly: true)
        
        gym(scheme: "GitHubAPP",
            clean: true,
            outputDirectory: "beta",
            outputName: "GitHubAPP")
        
        hockey(apiToken: "123456",
               ipa: "./beta/GitHubAPP.ipa",
               notes: "")
    }
    
    func publishAppStoreLane(withOptions options:[String: String]?) {
        desc("Publish app on App Store")
        incrementBuildNumber(buildNumber: options?["build_number"])
        incrementVersionNumber(versionNumber: options?["version_number"])
        
        testLane()
        
        match(type: "app-store",
              readonly: true)
        
        gym(scheme: "GitHubAPP",
            clean: true,
            outputDirectory: "build",
            outputName: "GitHubAPP")
        
        deliver(username: appleID,
                appIdentifier: appIdentifier,
                ipa: "build/GitHubAPP.ipa",
                skipBinaryUpload: true,
                skipScreenshots: true,
                skipMetadata: false,
                submitForReview: false,
                automaticRelease: false,
                phasedRelease: true)
    }
}
