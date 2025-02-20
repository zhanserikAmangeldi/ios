// ContentView.swift
import SwiftUI

struct ContentView: View {
    @State private var feedSystem = FeedSystem()
    @State private var posts: [Post] = []

    var body: some View {
        NavigationView {
            List(posts, id: \.id) { post in
                PostViewUI(post: post)
            }
            .navigationTitle("Social Feed")
            .onAppear {
                let post1 = Post(id: UUID(), authorId: UUID(), content: "Hello, world! #firstpost", likes: 5)
                let post2 = Post(id: UUID(), authorId: UUID(), content: "Another post #swiftui", likes: 10)
                feedSystem.addPost(post1)
                feedSystem.addPost(post2)
                posts = feedSystem.getFeedPosts()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Post") {
                        let newPost = Post(id: UUID(), authorId: UUID(), content: "New post! \(Date()) #new", likes: Int.random(in: 0...20))
                        feedSystem.addPost(newPost)
                        posts = feedSystem.getFeedPosts()
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
