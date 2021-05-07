#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

rm -rf ./XCFrameworks
mkdir ./XCFrameworks

# DJIWidget
echo "git \"file://${SCRIPT_DIR}\" \"$(git branch --show-current)\"" > Cartfile
carthage update DJIWidget --platform iOS --use-xcframeworks
mv Carthage/Build/DJIWidget.xcframework ./XCFrameworks
rm -rf Carthage/ Cartfile Cartfile.resolved

# FFmpeg
A=./XCFrameworks/tmp/iphonesimulator/FFmpeg.framework
B=./XCFrameworks/tmp/iphoneos/FFmpeg.framework
OUTPUT=./XCFrameworks/FFmpeg.xcframework

mkdir -p $A $B

cp -r ./FFmpeg/FFmpeg.framework/ $A/
xcrun lipo -remove arm64 $A/FFmpeg -o $A/FFmpeg

cp -r ./FFmpeg/FFmpeg.framework/ $B/
xcrun lipo -remove x86_64 $B/FFmpeg -o $B/FFmpeg

xcodebuild -create-xcframework -framework $A -framework $B -output $OUTPUT
rm -rf ./XCFrameworks/tmp
