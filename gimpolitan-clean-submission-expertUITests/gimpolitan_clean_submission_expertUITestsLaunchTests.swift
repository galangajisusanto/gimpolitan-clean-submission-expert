//
//  gimpolitan_clean_submission_expertUITestsLaunchTests.swift
//  gimpolitan-clean-submission-expertUITests
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import XCTest

class gimpolitan_clean_submission_expertUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
