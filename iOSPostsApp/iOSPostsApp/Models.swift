import Foundation
import UIKit

struct UserProfile: Hashable {
    let id: UUID
    let username: String
    var bio: String
    var followers: Int
    var profileImageURL: URL? // Add this for the profile picture

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Post: Hashable {
    let id: UUID
    let author: UserProfile // Store the entire UserProfile object, not just the ID
    var content: String
    var likes: Int
    var imageURL: URL? // Optional image URL for the post
    let timestamp: Date // Useful for sorting

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}
