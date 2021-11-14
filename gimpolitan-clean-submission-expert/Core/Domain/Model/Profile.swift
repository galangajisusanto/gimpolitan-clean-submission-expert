//
//  Profile.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 13/11/21.
//

import Foundation

class Profile {
    static let nameKey = "name"
    static let biographyKey = "biography"
    static let hobbyKey = "hobby"
    static var name: String {
        get {
            return UserDefaults.standard.string(forKey: nameKey) ?? "Galang Aji Susanto"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: nameKey)
        }
    }
    static var biography: String {
        get {
            return UserDefaults.standard.string(forKey: biographyKey) ?? "I'm a software engineer"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: biographyKey)
        }
    }
    static var hobby: String {
        get {
            return UserDefaults.standard.string(forKey: hobbyKey) ?? "Playing Game, Sport and Sleeping"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: hobbyKey)
        }
    }
    static func synchronize() {
        UserDefaults.standard.synchronize()
    }
}
