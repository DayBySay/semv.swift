build:
	swift build --disable-sandbox -c release

clean:
	swift package clean

test:
	swift test

xcodeproj:
	swift package generate-xcodeproj
