import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var startScene = ATCManager.shared.startScene
    
    var body: some View {
        SpriteView(scene: self.startScene)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea()
    }
}
