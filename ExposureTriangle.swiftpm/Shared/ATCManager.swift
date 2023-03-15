//
//  File.swift
//  
//
//  Created by Thiago de Oliveira Sousa on 10/04/22.
//

import Foundation
import SpriteKit


///This class contains all views. It serves as a controller to facilitate scene switching and avoid creating repeated scenes
public class ATCManager {
    
    static var shared = ATCManager()
    
    private init(){}
    
    let sceneSize = CGSize(width: 1024, height: 1366)
    
    var cameraViewModel = CameraViewModel()
    
    var startScene: SKScene {
        let scene = GameScene(size: sceneSize)
        scene.name = "StartScene"
        scene.scaleMode = .aspectFill
        return scene
    }
    
    var choiceScene: SKScene {
        let scene = ChoiceScene(size: sceneSize)
        scene.name = "ChoiceScene"
        scene.scaleMode = .aspectFill
        return scene
    }
    
    var cameraScene: SKScene {
        let scene = CameraScene(size: sceneSize, cameraViewModel: cameraViewModel)
        scene.name = "CameraScene"
        scene.scaleMode = .aspectFill
        return scene
    }
    
    var infoTriangle: SKScene {
        let scene = InfoTringle(size: sceneSize)
        scene.name = "infoTriangleScene"
        scene.scaleMode = .aspectFill
        return scene
    }
    
    
    var audioClick: SKAudioNode {
        let audio = SKAudioNode(fileNamed: "audioClick")
        audio.autoplayLooped = false
        return audio
    }
    
    var audioButton: SKAudioNode {
        let audio = SKAudioNode(fileNamed: "audioButton")
        audio.autoplayLooped = false
        return audio
    }
    
}
