import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(Color(red: 46 / 255, green: 111 / 255, blue: 64 / 255))
                    .edgesIgnoringSafeArea(.top)
                    .containerRelativeFrame(.vertical, count: 100, span: 50, spacing: 0)
                Image(information.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 10))
                    .shadow(radius: 10)
                    .containerRelativeFrame(.vertical)
            }
            .frame(height: 300)
            VStack(alignment: .center) {
                Text(information.name)
                    .font(.customTitle)
                Text(information.shortDescription)
                    .font(.customCallout)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("About")
                    .font(.customTitle)
                Text(information.briefBio)
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }

    }
}

#Preview {
    HomeView()
}
