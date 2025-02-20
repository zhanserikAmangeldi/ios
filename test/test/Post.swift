// Post.swift
import Foundation

struct Post: Hashable {
    let id: UUID
    let authorId: UUID
    var content: String
    var likes: Int

    // Hashable implementation
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // Equatable implementation
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}
