import SwiftUI

struct Goal: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let year: String
}

struct GoalsView: View {
    let goals: [Goal] = [
        Goal(title: "Find the Internship as Backend Dev", description: "Find the Internship on Backend Dev, Golang or PHP on the summer.", year: "2025"),
        Goal(title: "Take the route \"МАК\"", description: "One of the most interesting routes in Almaty due to the fact that in one day you can visit 4 peaks(all 3k km) at once.", year: "2025" ),
        Goal(title: "Climb to the first 4k km peak in the Almaty", description: "I want to climb on of the nearest 4k peaks in Almaty, I check the list and found the best one is \"Пик Карнизный\".", year: "2025" ),
        Goal(title: "Find the Full-time Job as Backend Dev", description: "After the Internship I hope to find job on full-time(dream).", year: "2025"),
        Goal(title: "Graduate from KBTU", description: "Complete my degree in Information Systems by 2026.", year: "2026"),
        Goal(title: "Climb a Famous Peak", description: "Challenge myself by reaching the summit of a well-known mountain.", year: "2030")
    ]
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 46 / 255, green: 111 / 255, blue: 64 / 255))
                    .edgesIgnoringSafeArea(.top)
                    .containerRelativeFrame(.vertical, count: 100, span: 20 , spacing: 0)
                Text("My Goals & Dreams")
                    .font(.customTitle1)
                    .foregroundColor(.white)
                    .padding()
            }
            List {
                if goals.isEmpty {
                    Text("Nothing")
                        .font(.customTitle2)
                        .offset(y: 100)
                } else {
                    ForEach(Array(goals.enumerated()), id: \.element.id) { index, goal in
                        if index == goals.count - 1 {
                            GoalCardView(goal: goal, last: false)
                        } else {
                            GoalCardView(goal: goal, last: true)
                        }
                    }
                    .listRowSeparator(.hidden)

                }
            }
            .listStyle(.plain)
            .padding(0)
            Spacer()
        }
    }
}


func GoalCardView(goal: Goal, last: Bool)->some View {
    HStack(alignment: .top, spacing: 30) {
        VStack(spacing: 10) {
            Circle()
                .fill(.black)
                .frame(width: 15, height: 15)
                .background(
                    Circle()
                        .stroke(Color.SecondaryColor, lineWidth: 1)
                        .padding(-3)
                )
            if last {
                Rectangle()
                    .fill(Color.SecondaryColor)
                    .frame(width: 3)
            }
        }
        
        VStack {
            HStack(alignment: .top, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(goal.title)
                        .font(.customTitle2)
                    Text(goal.description)
                        .font(.customBody)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Text(goal.year)
                    .font(.customCallout)
                
            }
            
        }
        .foregroundStyle(.white)
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color.SecondaryColor.cornerRadius(25)
        )
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}

#Preview {
    GoalsView()
}
