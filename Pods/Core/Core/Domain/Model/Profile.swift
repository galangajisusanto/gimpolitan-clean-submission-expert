//
//  Profile.swift
//  Core
//
//  Created by Galang Aji Susanto on 13/11/21.
//

import Foundation

public class Profile {
    public static let nameKey = "name"
    public static let biographyKey = "biography"
    public static let hobbyKey = "hobby"
    public static var name: String {
        get {
            return UserDefaults.standard.string(forKey: nameKey) ?? "Galang Aji Susanto"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: nameKey)
        }
    }
    public static var biography: String {
        get {
            return UserDefaults.standard.string(forKey: biographyKey) ?? "I'm a software engineer"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: biographyKey)
        }
    }
    public static var hobby: String {
        get {
            return UserDefaults.standard.string(forKey: hobbyKey) ?? "Playing Game, Sport and Sleeping"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: hobbyKey)
        }
    }
    public static func synchronize() {
        UserDefaults.standard.synchronize()
    }
}
