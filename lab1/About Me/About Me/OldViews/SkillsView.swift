import SwiftUI

struct SkillsView: View {
    var body: some View {
        VStack {
            List{
                Section(header: Text("Soft Skills")) {
                    ForEach(information.soft_skills, id: \.self) { skill in
                        Text(skill).padding(.leading, 40)
                    }
                }
                Section(header: Text("Hard Skills")) {
                    ForEach(information.hard_skills, id: \.0) { category, skills in
                        Section(header: Text(category).bold()) {
                            ForEach(skills, id: \.self) { skill in
                                Text(skill).padding(.leading, 40)
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    SkillsView()
}
