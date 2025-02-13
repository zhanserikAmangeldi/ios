import SwiftUI

struct RandomFactsView: View {
    @State private var fact = information.randomFacts
        .randomElement()!
    var body: some View {
        VStack {
            Text("Random Facts")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 56)

            VStack(alignment: .leading, spacing: 2) {
                Image(fact.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width: 300, height: 400, alignment: .topLeading)
                    .overlay(alignment: .bottomLeading) {
                        Text(fact.body)
                            .padding()
                            .background(Color(.black).opacity(0.9),
                                        in: RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                            .padding()
                            .foregroundStyle(.white)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                    .padding()


            }

            Button("New Fact") {
                fact = information.randomFacts.randomElement()!
            }.buttonStyle(.borderedProminent).controlSize(.large)

            Spacer()
        }
    }
}

#Preview {
    RandomFactsView()
}
