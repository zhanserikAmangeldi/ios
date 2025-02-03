import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("About me")
                .font(.largeTitle)
                .fontWeight(.bold)
            Image(information.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(56)
            Text(information.name)
                .font(.title)
            Text(information.shortDescription)
                .font(.callout)
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
