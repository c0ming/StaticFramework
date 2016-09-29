#!/bin/sh

set -e

if [ -d "${SRCROOT}/build" ]; then
rm -rf "${SRCROOT}/build"
fi

if [ -d "${SRCROOT}/${PROJECT_NAME}.framework" ]; then
rm -rf "${SRCROOT}/${PROJECT_NAME}.framework"
fi

xcodebuild -sdk "iphoneos"
xcodebuild -sdk "iphonesimulator"

# 如果没有在项目中设置
# xcodebuild MACH_O_TYPE="staticlib" OTHER_CFLAGS="-fembed-bitcode" -sdk "iphoneos"
# xcodebuild MACH_O_TYPE="staticlib" OTHER_CFLAGS="-fembed-bitcode" -sdk "iphonesimulator"

cp -r "${SRCROOT}/build/Release-iphoneos/${PROJECT_NAME}.framework" "${SRCROOT}/${PROJECT_NAME}.framework"

lipo -create -output "${SRCROOT}/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${SRCROOT}/build/Release-iphoneos/${PROJECT_NAME}.framework/${PROJECT_NAME}" "${SRCROOT}/build/Release-iphonesimulator/${PROJECT_NAME}.framework/${PROJECT_NAME}"

if [ -d "${SIMULATOR_SWIFT_MODULES_DIR}" ]; then
cp -r "${SRCROOT}/build/Release-iphonesimulator/${PROJECT_NAME}.framework/Modules/${PROJECT_NAME}.swiftmodule/" "${SRCROOT}/${PROJECT_NAME}.framework/Modules/${PROJECT_NAME}.swiftmodule"
fi

if [ -d "${SRCROOT}/build" ]; then
rm -rf "${SRCROOT}/build"
fi

open "${PROJECT_DIR}"