//
//  File.swift
//  CameraWWDC
//
//  Created by Thiago de Oliveira Sousa on 06/04/22.
//

import Foundation
import SpriteKit

extension ChoiceScene {
    
    func ScrollToLeft(choice: ChoiceModel) -> SKSpriteNode {
        let node = choice.node
        
        let newPosition = newRightPosition(current: choice.currentPostion)
        
        choice.currentPostion = newPosition
        
        let newScale = setChoiceScale(position: newPosition)
        
        let actions = [SKAction.moveTo(x: newPosition.positon(), duration: 1.0),
                       SKAction.scale(to: newScale, duration: 1.0)]
        let action = SKAction.group(actions)
        
        node.run(action)
        
        print(newPosition)
        return node
    }
    
    func ScrollToRight(choice: ChoiceModel) -> SKSpriteNode {
        let node = choice.node
        
        let newPosition = newLeftPosition(current: choice.currentPostion)
        
        let newScale = setChoiceScale(position: newPosition)
        
        choice.currentPostion = newPosition
        
        let actions = [SKAction.moveTo(x: newPosition.positon(), duration: 1.0),
                       SKAction.scale(to: newScale, duration: 1.0)]
        let action = SKAction.group(actions)
        
        node.run(action)
        
        
        return node
    }
    
    
    private func newRightPosition(current: ChoicePosition) -> ChoicePosition {
        switch current {
        case .SECONDLEFT:
            return .SECONDLEFT
        case .FIRSTLEFT:
            return .SECONDLEFT
        case .CENTER:
            return .FIRSTLEFT
        case .FIRSTRIGHT:
            return .CENTER
        case .SECONDRIGHT:
            return .FIRSTRIGHT
        }
    }
    
    private func newLeftPosition(current: ChoicePosition) -> ChoicePosition {
        switch current {
        case .SECONDLEFT:
            return .FIRSTLEFT
        case .FIRSTLEFT:
            return .CENTER
        case .CENTER:
            return .FIRSTRIGHT
        case .FIRSTRIGHT:
            return .SECONDRIGHT
        case .SECONDRIGHT:
            return .SECONDRIGHT
        }
    }
    
    func setChoiceScale(position: ChoicePosition) -> CGFloat {
        
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


