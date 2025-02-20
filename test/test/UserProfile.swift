// UserProfile.swift
import Foundation

struct UserProfile: Hashable {
    let id: UUID
    let username: String
    var bio: String
    var followers: Int

    // Hashable implementation (only use immutable properties)
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(username)
    }

    // Equatable implementation (compare relevant properties)
    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        return lhs.id == rhs.id && lhs.username == rhs.username
    }
}
