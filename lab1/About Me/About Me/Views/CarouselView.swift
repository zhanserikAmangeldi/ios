import SwiftUI

struct CarouselView: View {
    @State private var scrollID: Int?
    @State private var scrollViewContentSize: CGSize = .zero

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(0..<images.count, id: \.self) { index in
                            let image = images[index]
                            VStack {
                                Image(image)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding()
                            }
                            .containerRelativeFrame(.horizontal)
                            .scrollTransition(.animated, axis: .horizontal) { content, phase in content
                                    .opacity(phase.isIdentity ? 1.0 : 0.6)
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.6)
                            }
                        }
                    }
                    .scrollTargetLayout()
                    .background(
                        GeometryReader { geo -> Color in
                            DispatchQueue.main.async {
                                scrollViewContentSize = geo.size
                            }
                            return Color.clear
                        }
                    )
                }
                .scrollPosition(id: $scrollID)
                .scrollTargetBehavior(.paging)
                IndicatorView(imageCount: images.count, scrollID: $scrollID)
            }
        }
    }
}

struct IndicatorView: View {
    let imageCount: Int
    @Binding var scrollID: Int?
    
    var body: some View {
        HStack {
            ForEach(0..<imageCount, id: \.self) {indicator in
                Button {
                    withAnimation {
                        scrollID = indicator
                    }
                } label: {
                    Image(systemName: "circle.fill").font(.system(size: 8)).foregroundStyle(indicator == (scrollID ?? 0) ? Color.PrimaryColor : Color(.lightGray))
                }
            }
        }
        .padding(7)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.lightGray))
        )
        .opacity(0.2)
    }
}

#Preview {
    CarouselView()
}
