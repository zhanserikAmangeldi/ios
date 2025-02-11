import SwiftUI

import SwiftUI

struct Hobby: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
}

struct HobbiesView: View {
    let hobbies: [Hobby] = [
        Hobby(name: "Climbing", imageName: "Image2", description: "I love climbing mountains and exploring new heights."),
        Hobby(name: "Gaming", imageName: "Image3", description: "I enjoy playing video games in my free time."),
        Hobby(name: "Movies & Books", imageName: "Image4", description: "Watching films and reading books are my ways to relax.")
    ]

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: 46 / 255, green: 111 / 255, blue: 64 / 255))
                        .edgesIgnoringSafeArea(.top)
                        .containerRelativeFrame(.vertical, count: 100, span: 20 , spacing: 0)
                    Text("My Interests & Hobbies")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                }

                List {
                    VStack(alignment: .leading) {
                        ForEach(hobbies) { hobby in
                            VStack(alignment: .leading) {
                                
                                Image(hobby.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .cornerRadius(15)
                                
                                Text(hobby.name)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.top, 5)
                                
                                Text(hobby.description)
                                    .font(.body)
                                    .foregroundColor(.gray)
                                
                                if hobby.name == "Climbing" {
                                    NavigationLink(destination: CarouselView()) {
                                        Text("Some Pictures from last year")
                                    }
                                    .foregroundStyle(Color.blue)
                                    .padding()
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(15)
                            .shadow(radius: 5)
                        }
                        .padding(.bottom, 10)
                    }
                    .padding()
                }
                .listStyle(.plain)
                
            }
        }
    }
}

#Preview {
    HobbiesView()
}
