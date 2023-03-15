//
//  CameraScene.swift
//  WWDC2022
//
//  Created by Thiago de Oliveira Sousa on 07/04/22.
//

import Foundation
import SpriteKit
import SwiftUI


class CameraScene: SKScene {

    var viewModel: CameraViewModel
    
    var cameraSprite: SKSpriteNode {
        let camera = SKSpriteNode(imageNamed: "Camera")
        camera.name = "Camera"
        camera.setScale(Scales.normal.value())
        camera.zPosition = 3
        return camera
    }
    
    var menuButton: SKSpriteNode {
        let button = SKSpriteNode(imageNamed: "Menu_Button")
        button.name = "Menu_Button"
        button.setScale(Scales.normal.value())
        button.zPosition = 4
        button.position.x = 310
        button.position.y = -80
        return button
    }
    
    var infoButton: SKSpriteNode {
        let button = SKSpriteNode(imageNamed: "Info_Button")
        button.name = "Info_Button"
        button.setScale(Scales.normal.value())
        button.zPosition = 4
        button.position.x = 310
        button.position.y = 8
        return button
    }
    
    var galleryButton: SKSpriteNode {
        let button = SKSpriteNode(imageNamed: "Gallery_Button")
        button.name = "Gallery_Button"
        button.setScale(Scales.normal.value())
        button.zPosition = 4
        button.position.x = 310
        button.position.y = -153
        return button
    }
    
    var scrollBar: SKSpriteNode {
        let bar = SKSpriteNode(imageNamed: "ScrollBar")
        bar.name = "ScrollBar"
        bar.setScale(Scales.normal.value())
        bar.zPosition = 5
        bar.position.x = -130
        bar.position.y = -220
        return bar
    }
    
    var nextButton: SKSpriteNode {
        let button = SKSpriteNode(imageNamed: "cameraNextButton")
        button.name = "cameraNextButton"
        button.setScale(Scales.normal.value())
        button.zPosition = 5
        button.position.x = 390
        button.position.y = -75
        return button
    }
    
    var backButton: SKSpriteNode {
        let button = SKSpriteNode(imageNamed:  "cameraBackButton")
        button.name = "cameraBackButton"
        button.setScale(Scales.normal.value())
        button.zPosition = 3
        button.position.x = 230
        button.position.y = -75
        return button
    }
    
    var numberLabel: SKLabelNode {
        let number = SKLabelNode(text: viewModel.numberLabel)
        number.name = "numberLabel"
        number.fontColor = UIColor(named: "LabelYellow")
        number.fontSize = 40
        number.fontName = "SFCompactRounded-Black"
        number.zPosition = 5
        number.position.x = -130
        number.position.y = -190
        return number
    }
    
    var photo: SKSpriteNode {
        let photo = SKSpriteNode(imageNamed: viewModel.numberLabel)
        photo.name = "photo"
        photo.zPosition = 4
        photo.setScale(0.80)
        photo.position.x = -130
        photo.position.y = -75
        return photo
    }
    
    var titleLabel: SKLabelNode {
        let label = SKLabelNode(text: viewModel.currentChoice.rawValue)
        label.name = "titleLabel"
        label.zPosition = 3
        label.fontSize = 40
        label.fontName = "SFCompactRounded-Black"
        label.fontColor = .black
        label.position = CGPoint(x: -85, y: 160)
        return label
    }
    
    var backgroundImage: SKSpriteNode {
        let texture = SKTexture(imageNamed: "ApertureBackground")
        let bgImage = SKSpriteNode(texture: texture)
        bgImage.zPosition = -10
        bgImage.name = "background"
        bgImage.setScale(2.0)
        
        return bgImage
    }
    
    var infoImage: SKSpriteNode {
        let texture = SKTexture(imageNamed: "infoShutter")
        let infoImage = SKSpriteNode(texture: texture)
        infoImage.name = "infoImage"
        infoImage.setScale(0.75)
        infoImage.zPosition = 8
        infoImage.isHidden = true
        return infoImage
    }
    
    var infoBackButton: SKSpriteNode {
        let button = SKSpriteNode(imageNamed: "Back_Button")
        button.name = "infoBackButton"
        button.setScale(Scales.normal.value())
        button.position = CGPoint(x: -450, y: 280)
        button.zPosition = 10
        button.isHidden = true
        
        return button
    }
    
    init(size: CGSize, cameraViewModel: CameraViewModel) {
        
        viewModel = cameraViewModel
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        viewModel.setupScene()
        addChildNodes()
        setBackground()
        setInfo()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            switch touchedNode.name {
            case "cameraNextButton":
                nextButtonAction()
            case "cameraBackButton":
                backButtonAction()
            case "Menu_Button":
                ATCManager.shared.cameraViewModel.setTitle(to: .SHUTTER)
                menuAction()
            case "Info_Button":
                hiddenInfo(isHidden: false)
            case "infoBackButton":
                hiddenInfo(isHidden: true)
            case .none:
                break
            case .some(_):
                break
            }
        }
    }
    
    func setBackground() {
        if let bg = self.childNode(withName: "background") as? SKSpriteNode {
            switch viewModel.currentChoice {
            case .SHUTTER:
                bg.texture = SKTexture(imageNamed: "ShutterBackground")
            case .APERTURE:
                bg.texture = SKTexture(imageNamed: "ApertureBackground")
            case .ISO:
                bg.texture = SKTexture(imageNamed: "ISOBackground")
            }
        }
    }
    
    func setInfo() {
        if let info = self.childNode(withName: "infoImage") as? SKSpriteNode {
            switch viewModel.currentChoice {
            case .SHUTTER:
                info.texture = SKTexture(imageNamed: "infoShutter")
            case .APERTURE:
                info.texture = SKTexture(imageNamed: "infoAperture")
            case .ISO:
                info.texture = SKTexture(imageNamed: "infoISO")
            }
        }
    }
    
    
    /// This function change texture photo image to new image based on current number
    func changeImage() {
        if let photo = self.childNode(withName: "photo") as? SKSpriteNode {
            let newPhoto = SKTexture(imageNamed: viewModel.numberLabel)
            photo.texture = newPhoto
        }
    }
    
    func nextButtonAction() {
        if let number = self.childNode(withName: "numberLabel") as? SKLabelNode {
            viewModel.nextButtonAction(label: number)
            changeImage()
        }
    }
    
    func backButtonAction() {
        if let number = self.childNode(withName: "numberLabel") as? SKLabelNode {
            viewModel.backButtonAction(label: number)
            changeImage()
        }
    }
    
    func menuAction() {
        self.scene?.view?.presentScene(ATCManager.shared.choiceScene)
    }
    
    func hiddenInfo(isHidden hidden: Bool) {
        if let infoI = self.childNode(withName: "infoImage") {
            infoI.isHidden = hidden
        }
        
        if let infoB = self.childNode(withName: "infoBackButton") {
            infoB.isHidden = hidden
        }
    }
    
    func addChildNodes() {
        addChild(cameraSprite)
        addChild(menuButton)
        addChild(infoButton)
        //addChild(galleryButton)
        addChild(scrollBar)
        addChild(backButton)
        addChild(nextButton)
        addChild(numberLabel)
        addChild(photo)
        addChild(titleLabel)
        addChild(backgroundImage)
        addChild(infoImage)
        addChild(infoBackButton)
    }
    
    
}
