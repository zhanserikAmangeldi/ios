import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundStyle(Color.PrimaryColor)
                    .edgesIgnoringSafeArea(.top)
                    .containerRelativeFrame(.vertical, count: 100, span: 50, spacing: 0)
                Image(information.image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 250, maxHeight: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 10))
                    .shadow(radius: 10)
                    .containerRelativeFrame(.vertical)
            }
            .frame(height: 300)
            VStack(alignment: .center) {
                Text(information.name)
                    .font(.customTitle1)
                Text(information.shortDescription)
                    .font(.customCallout)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("About")
                    .font(.customTitle2)
                ScrollView {
                    Text(information.briefBio)
                        .font(.customBody)
                        .lineLimit(nil)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                .frame(maxHeight: 300)
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }

    }
}

#Preview {
    HomeView()
}
