import SwiftUI

struct ContentView: View {
    private var search = ["Example Item 1", "Example Item 2"]
    let imageNames = ["Logo", "lol", "icons8-plus-50"]
    @State private var searchText = ""
    @State private var images: [UIImage] = []
    @State private var scaleEffectButton: CGFloat = 1 // For "Sort and Filter" button animation
    
    init() {
        _images = State(initialValue: ContentView.loadImages(imageNames: imageNames))
    }
    
    static func loadImages(imageNames: [String]) -> [UIImage] {
        var loadedImages: [UIImage] = []
        for imageName in imageNames {
            if let image = UIImage(named: imageName) {
                loadedImages.append(image)
            } else {
                print("Failed to load image: \(imageName)")
            }
        }
        return loadedImages
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Top content
            HStack {
                Text("Found \(images.count)")
                    .font(.system(size: 30, weight: .heavy, design: .serif))
                Spacer()
                Image("button_sort-and-filter")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 100)
                    .scaleEffect(scaleEffectButton)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            scaleEffectButton = 1.1
                        }
                        // Reset to original size after animation
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.spring()) {
                                scaleEffectButton = 1
                            }
                        }
                    }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, -10)
            .padding(.horizontal)
            
            
            // Images and search bar
            VStack(spacing: 0) {
                if images.isEmpty {
                    Text("Nothing Has Been Found")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        ForEach(Array(images.enumerated()), id: \.element) { _, image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .padding()
                        }
                    }
                }
                
                // Search bar
                TextField("Search...", text: $searchText)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal, 15)
                    .padding(.bottom, 20)
            }
            HStack(spacing: 30) { // Adjust the spacing value as needed
                Image("icons8-glasses-50")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30) // Adjust the size as needed
                Image("icons8-plus-50")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30) // Adjust the size as needed
                Image("icons8-message-50")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30) // Adjust the size as needed
                Image("icons8-account-50")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30) // Adjust the size as needed
            }
            .padding() // Adds padding around the HStack, optional for more spacing
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
