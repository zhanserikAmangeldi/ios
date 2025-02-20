// FeedSystem.swift
import Foundation

class FeedSystem {
    private var userCache: [UUID: UserProfile] = [:]
    private var feedPosts: [Post] = []
    private var hashtags: Set<String> = []

    func addPost(_ post: Post) {
        feedPosts.insert(post, at: 0)
        if userCache[post.authorId] == nil {
            // Fetch and cache user profile
        }
        let newHashtags = extractHashtags(from: post.content)
        hashtags.formUnion(newHashtags)
    }

    func removePost(_ post: Post) {
        if let index = feedPosts.firstIndex(of: post) {
            feedPosts.remove(at: index)
        }
    }

    func getFeedPosts() -> [Post] {
        return feedPosts
    }

    private func extractHashtags(from content: String) -> Set<String> {
        let words = content.split(separator: " ")
        let hashtagWords = words.filter { $0.starts(with: "#") }
        return Set(hashtagWords.map { String($0) })
    }
}
