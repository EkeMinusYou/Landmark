import SwiftUI

struct LandmarkList: View {
  @State private var showFavoritesOnly = false

  var filteredLandmarks: [Landmark] {
    landmarks.filter { landmark in
      (!showFavoritesOnly) || landmark.isFavorite
    }
  }

  var body: some View {
    NavigationSplitView {
      List {
        Toggle(isOn: $showFavoritesOnly) {
          Text("Favorites only")
        }

        ForEach(filteredLandmarks) { landmark in
          NavigationLink {
            LandmarkDetails(landmark: landmark)
          } label: {
            LandmarkRow(landmark: landmark)
          }
        }
        .navigationTitle("Landmarks")
      }
    } detail: {
      Text("Select a landmark")
    }
    .animation(.default, value: showFavoritesOnly)
  }
}

#Preview {
  LandmarkList()
}
