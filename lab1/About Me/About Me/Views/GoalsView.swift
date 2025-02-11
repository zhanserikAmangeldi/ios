import SwiftUI

struct Goal: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let year: String
}

struct GoalsView: View {
    let goals: [Goal] = [
        Goal(title: "Graduate from KBTU", description: "Complete my degree in Information Systems by 2026.", year: "2026"),
        Goal(title: "Become a Mobile Developer", description: "Master iOS and Android development to work on innovative projects.", year: "2027"),
        Goal(title: "Travel the World", description: "Visit at least 10 different countries and explore new cultures.", year: "2028"),
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
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
            }
            List {
                if goals.isEmpty {
                    Text("Nothing")
                        .font(.customTitle)
                        .offset(y: 100)
                } else {
                    ForEach(goals) { goal in
                        GoalCardView(goal: goal)
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


func GoalCardView(goal: Goal)->some View {
    HStack(alignment: .top, spacing: 30) {
        VStack(spacing: 10) {
            Circle()
                .fill(.black)
                .frame(width: 15, height: 15)
                .background(
                    Circle()
                        .stroke(.black, lineWidth: 1)
                        .padding(-3)
                )
            Rectangle()
                .fill(.black)
                .frame(width: 3)
        }
        
        VStack {
            HStack(alignment: .top, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(goal.title)
                        .font(.headline )
                    Text(goal.description)
                        .font(.customCallout)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Text(goal.year)
                
            }
            
        }
        .foregroundStyle(.white)
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color(.accent)
                .cornerRadius(25)
        )
    }
    .frame(maxWidth: .infinity, alignment: .leading)
}

#Preview {
    GoalsView()
}
