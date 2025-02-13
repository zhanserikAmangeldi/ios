import Foundation

import SwiftUI

struct StoryView: View {
    @Binding var selectedTab: Int
    var body: some View {
        NavigationView {
            VStack {
                Text("My Story")
                    .font(.customTitle1)
                
                List {
                    ForEach(information.story, id: \.topic) { story in
                        Section(header:
                                    Text(story.topic)
                            .font(.headline)
                            .padding(10)
                                
                        ) {
                            Text(story.body)
                            if story.topic == "Hobbies" {
                                NavigationLink(destination: CarouselView()) {
                                    Text("Some Pictures from last year")
                                }
                                .foregroundStyle(Color.blue)
                            } else if story.topic == "Education" {
                                NavigationLink(destination: SkillsView()) {
                                    Text("My Skills")
                                }
                                .foregroundStyle(Color.blue)
                            }
                        }
                    }
                    .listRowBackground(Color.white)
                }
                .scrollContentBackground(.hidden)
            }
            .id(selectedTab)
        }
    }
}

