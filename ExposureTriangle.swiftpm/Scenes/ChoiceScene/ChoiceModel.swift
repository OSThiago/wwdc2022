//
//  ChoiceModel.swift
//  CameraWWDC
//
//  Created by Thiago de Oliveira Sousa on 06/04/22.
//

import Foundation
import SpriteKit


class ChoiceModel {
    
    var currentPostion: ChoicePosition
    let imageName: String
    private var imageYposition: CGFloat = 35
    private var zPosition: CGFloat = 2
    
    lazy var node: SKSpriteNode = SKSpriteNode(imageNamed: imageName)
    
    init(currentPosition: ChoicePosition, imageName: String) {
        self.currentPostion = currentPosition
        self.imageName = imageName
        
        let scale = setChoiceScale(position: currentPosition)
        
        node.name = imageName
        node.setScale(scale)
        node.zPosition = zPosition
        node.position.y = imageYposition
        node.position.x = currentPosition.positon()
    }
    
    private func setChoiceScale(position: ChoicePosition) -> CGFloat {
        switch position {
        case .SECONDLEFT:
            return Scales.secondaryScale.value()
        case .FIRSTLEFT:
            return Scales.secondaryScale.value()
        case .CENTER:
            return Scales.normal.value()
        case .FIRSTRIGHT:
            return Scales.secondaryScale.value()
        case .SECONDRIGHT:
            return Scales.secondaryScale.value()
        }
    }
}
