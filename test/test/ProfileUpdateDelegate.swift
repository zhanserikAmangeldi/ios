// ProfileUpdateDelegate.swift
import Foundation

protocol ProfileUpdateDelegate: AnyObject { // Restrict to class-only protocol
    func profileDidUpdate(_ profile: UserProfile)
    func profileLoadingError(_ error: Error)
}
