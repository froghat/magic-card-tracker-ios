#!/bin/sh
if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
    fastlane test --verbose
    bundle exec danger
    exit $?
fi

if [[ "$TRAVIS_BRANCH" == "develop" ]]; then
    fastlane beta --verbose
    exit $?
fi

if [[ "$TRAVIS_BRANCH" == "master" ]]; then
    fastlane release --verbose
    exit $?
fi