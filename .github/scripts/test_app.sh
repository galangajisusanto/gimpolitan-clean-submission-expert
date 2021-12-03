#!/bin/bash

set -eo pipefail

xcodebuild -workspace gimpolitan-clean-submission-expert.xcworkspace \
            -scheme gimpolitan-clean-submission-expert\ iOS \
            -destination platform=iOS\ Simulator,OS=14.4,name=iPhone\ 12 \
            clean test | xcpretty
