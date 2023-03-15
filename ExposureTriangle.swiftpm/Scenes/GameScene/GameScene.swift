//
//  File.swift
//  CameraWWDC
//
//  Created by Thiago de Oliveira Sousa on 05/04/22.
//

import Foundation
import SpriteKit
import UIKit

class GameScene: SKScene, ObservableObject {
    
    public var startBackground: SKSpriteNode {
        let background = SKSpriteNode(imageNamed: "Background_Start")
        background.zPosition = -10
        return background
    }
    
    public var startButton: SKSpriteNode {
        let startButton = SKSpriteNode(imageNamed: "Start")
        startButton.zPosition = 2
        startButton.run(pulse())
        return startButton
    }
    
    var audioClick: SKAudioNode {
        let audio = SKAudioNode(fileNamed: "audioClick")
        audio.autoplayLooped = false
        return audio
    }
    
    public override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func didMove(to view: SKView) {
        /// Change anchorPoint to center
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        addChild(startButton)
        addChild(startBackground)
    }
    
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        scene?.view?.presentScene(ATCManager.shared.infoTriangle)
        
    }
    
    public func pulse() -> SKAction{
        
        let pulse = [SKAction.scale(to: 1.1, duration: 0.5),
                       SKAction.scale(to: 1, duration: 0.5)]
        
        let repeatPulse = SKAction.repeatForever(.sequence(pulse))
        
        return repeatPulse
        
    }
    
    lazy var clickSoundAction: SKAction = {
        return SKAction.playSoundFileNamed("audioClick.wav", waitForCompletion: false)
    }()
    
}
