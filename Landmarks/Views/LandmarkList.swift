import SwiftUI

struct LandmarkList: View {
  @State private var showFavoritesOnly = true

  var filteredLandmarks: [Landmark] {
    landmarks.filter { landmark in
      (!showFavoritesOnly) || landmark.isFavorite
    }
  }

  var body: some View {
    NavigationSplitView {
      List(filteredLandmarks) { landmark in
        NavigationLink {
          LandmarkDetails(landmark: landmark)
        } label: {
          LandmarkRow(landmark: landmark)
        }
      }
      .navigationTitle("Landmarks")
    } detail: {
      Text("Select a landmark")
    }
  }
}

#Preview {
  LandmarkList()
}
