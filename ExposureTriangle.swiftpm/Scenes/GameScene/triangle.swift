//
//  File.swift
//  
//
//  Created by Thiago de Oliveira Sousa on 22/04/22.
//

import Foundation
import UIKit
import SpriteKit

class InfoTringle: SKScene {
    
    var button: SKSpriteNode {
        let button = SKSpriteNode(imageNamed: "Click_Button")
        button.name = "Click_Button"
        button.zPosition = 2
        button.setScale(Scales.normal.value())
        button.position = CGPoint(x: 0, y: -300)
        return button
    }
    
    var backgroundImage: SKSpriteNode {
        let image = SKSpriteNode(imageNamed: "triangle")
        image.zPosition = 1
        image.setScale(0.75)
        return image
    }
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        
        // add notes
        self.addChild(backgroundImage)
        self.addChild(button)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            if touchedNode == self.childNode(withName: "Click_Button") {
                self.scene?.view?.presentScene(ATCManager.shared.choiceScene)
            }
        }
    }
    
    
    
}
