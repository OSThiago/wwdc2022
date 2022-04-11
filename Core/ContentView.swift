import SwiftUI
import SpriteKit

struct ContentView: View {
    
     var sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1024, height: 1366))
    
    var Scene: SKScene {
        let scene = GameScene(view: sceneView, size: CGSize(width: 1024, height: 1366))
        scene.size = CGSize(width: 1024, height: 1366)
        scene.scaleMode = .aspectFill
        return scene
    }
    
    var body: some View {
        SpriteView(scene: self.Scene)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
            .ignoresSafeArea()
    }
}


