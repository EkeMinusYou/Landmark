import SwiftUI

struct LandmarkDetails: View {
  @Environment(ModelData.self) var modelData
  var landmark: Landmark

  var landmarkIndex: Int {
    modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
  }

  var body: some View {
    @Bindable var modelData = modelData

    ScrollView {
      MapView(coordinate: landmark.locationCoordinate)
        .frame(height: 300)

      CircleImage(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)

      VStack(alignment: .leading) {
        HStack {
          Text(landmark.name)
            .font(.title)
        }

        HStack {
          Text(landmark.park)
          Spacer()
          Text(landmark.state)
        }
        .font(.subheadline)
        .foregroundStyle(.secondary)

        Divider()

        Text("Abount \(landmark.name)")
          .font(.title2)
        Text(landmark.description)
      }
      .padding()
    }
    .navigationTitle(landmark.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  let modelData = ModelData()
  return LandmarkDetails(landmark: ModelData().landmarks[0]).environment(modelData)
}