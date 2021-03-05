SWIFT_BUILD_FLAGS?=--disable-sandbox -c release

.PHONY: build
build:
	swift build $(SWIFT_BUILD_FLAGS)

.PHONY: clean
clean:
	swift package clean

.PHONY: test
test:
	swift test

.PHONY: xcodeproj
xcodeproj:
	swift package generate-xcodeproj
