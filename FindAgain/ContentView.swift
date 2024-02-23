import SwiftUI

struct ContentView: View {
    private var search = ["Example Item 1", "Example Item 2"] // Sample search items
    let imageNames = ["Logo", "Logo", "Logo"]
    @State private var searchText = ""
    @State private var images: [UIImage] = []
    
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
            VStack {
                HStack {
                    Text("Found: \(images.count)").font(.system(size: 30, weight: .heavy, design: .serif))
                    Spacer()
                    Image("button_sort-and-filter")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 100)
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                
            }
            
            // Images and search bar
            VStack(spacing: 0) {
                if images.isEmpty {
                    // If empty, display a message
                    Text("Nothing Has Been Found")
                        .font(.title)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        ForEach(images, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .padding()
                        }
                    }
                }
                
                // Custom search bar at the bottom
                TextField("Search...", text: $searchText)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal, 15)
                    .padding(.bottom, 20)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    var things: [String] {
        let lcItems = search.map { $0.lowercased() }
        return searchText.isEmpty ? lcItems : lcItems.filter {
            $0.contains(searchText.lowercased())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
