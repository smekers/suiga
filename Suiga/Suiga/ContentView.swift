import SwiftUI
import Playgrounds

struct ContentView: View {
    @State var lightColor: Color = .white
    @State var brightness: Double = 0.0
    @State var startBrightness: Double = 0.0
    @State var togglePicker: Bool = false
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            if brightness > 0 {
                lightColor
                    .ignoresSafeArea()
                    .opacity(brightness)
            }
            VStack {
                Text("Swipe up to light up!")
                    .foregroundStyle(lightColor)
                    .padding()
                    .onTapGesture {
                        togglePicker = !togglePicker
                    }
                if togglePicker {
                    ColorPicker("Choose a color", selection: $lightColor, supportsOpacity: false)
                }
            }
            
        }.gesture(
            DragGesture()
                .onChanged({ value in
                    if startBrightness == 0.0 {
                        startBrightness = brightness
                    }
                    
                    let change = -value.translation.height / 300.0
                    let newBrightness = min(max(startBrightness + change, 0.0), 1.0)
                    
                    UIScreen.current?.brightness = CGFloat(newBrightness)
                    self.brightness = newBrightness
                })
        )
        
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
