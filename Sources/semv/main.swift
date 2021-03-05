import Foundation
import ArgumentParser
import PackageDescription

struct Semv: ParsableCommand {
    static var configuration = CommandConfiguration(commandName: "semv",
                                                    abstract: "Create version strings based on semantic versioning.",
                                                    version: "0.1.0")

    @OptionGroup
    var options: Options

    func run() throws {
        guard let version = Version(options.version) else {
            throw VersioningError.versionParseError
        }
        
        guard let phase = Phase(rawValue: options.phase) else {
            throw VersioningError.phaseParseError
        }

        print(version.increment(phase: phase))
    }
}

struct Options: ParsableArguments {
    @Argument(help: "A input version")
    var version: String
    
    @Argument(help: "The part that should be incremented")
    var phase: String
}

enum VersioningError: Error, LocalizedError {
    case versionParseError
    case phaseParseError

    var errorDescription: String? {
        switch self {
        case .versionParseError:
            return "Input version string does not correspond to the semantic version string."
        case .phaseParseError:
            return "Input phase string could not be parsed."
        }
    }
}

Semv.main()
