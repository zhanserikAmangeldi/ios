// PostViewUI.swift (SwiftUI View)
import SwiftUI

struct PostViewUI: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading) {
            Text("Author ID: \(post.authorId)")
                .font(.headline)
            Text(post.content)
                .font(.body)
            Text("Likes: \(post.likes)")
                .font(.caption)
        }
        .padding()
    }
}
