//
//  Version.swift
//  semv
//
//  Created by Sei Takayuki on 2021/03/05.
//

import Foundation
import PackageDescription

extension Version {
    func increment(phase: Phase) -> Version {
        switch phase {
        case .major:
            return Version(major + 1, 0, 0)
        case .minor:
            return Version(major, minor + 1, 0)
        case .patch:
            return Version(major, minor, patch + 1)
        }
    }
}
