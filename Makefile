build:
	swift build --disable-sandbox -c release

clean:
	swift package clean

xcodeproj:
	swift package generate-xcodeproj
