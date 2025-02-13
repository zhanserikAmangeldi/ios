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
        Hobby(name: "Hiking", imageName: "Image2", description: "I love hiking on mountains and exploring new heights. Additionally, I like to take the picture of mountains."),
        Hobby(name: "Gaming", imageName: "games", description: "I enjoy playing video games in my free time."),
        Hobby(name: "Movies & Books", imageName: "showtruman", description: "Watching films and reading books are my ways to relax.")
    ]
    
    @Binding var selectedTab: Int


    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.PrimaryColor)
                        .edgesIgnoringSafeArea(.top)
                        .containerRelativeFrame(.vertical, count: 100, span: 20 , spacing: 0)
                    Text("My Interests & Hobbies")
                        .font(.customTitle1)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                }

                List {
                    ForEach(hobbies) { hobby in
                        VStack(alignment: .leading) {
                            
                            Image(hobby.imageName)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(15)
                            
                            Text(hobby.name)
                                .font(.customTitle2)
                                .padding(.top, 5)
                            
                            Text(hobby.description)
                                .font(.customBody)
                                .foregroundColor(.gray)
                            
                            if hobby.name == "Hiking" {
                                NavigationLink(destination: CarouselView()) {
                                    Text("Some Pictures from last year")
                                        .font(.customButton)
                                        .foregroundStyle(Color.PrimaryColor)
                                        .padding()
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(15)
                        .shadow(radius: 5)
                    }
                    .listRowSeparator(.hidden)
                    .padding(.bottom, 10)
                }
                .listStyle(.plain)
                
            }
            .id(selectedTab)
        }
    }
}

