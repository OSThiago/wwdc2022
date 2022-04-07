//
//  ButtonChoiceModel.swift
//  CameraWWDC
//
//  Created by Thiago de Oliveira Sousa on 06/04/22.
//

import Foundation
import SpriteKit

class ButtonChoiceModel {
    
    let imageName: String
    var isPresent: Bool
    
    lazy var node: SKSpriteNode = SKSpriteNode(imageNamed: imageName)
    
    init(imageName: String, xPosition: CGFloat, yPosition: CGFloat) {
        self.isPresent = false
        
        self.imageName = imageName
        
        node.setScale(Scales.normal.value())
        node.position.y = yPosition
        node.position.x = xPosition
        node.zPosition = 3
        node.name = imageName
    }
    
    
    
}
