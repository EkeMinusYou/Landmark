import SwiftUI

struct LandmarkList: View {
  var body: some View {
    NavigationSplitView {
      List(landmarks) { landmark in
        NavigationLink {
          LandmarkDetails()
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
