//
//  File.swift
//  CameraWWDC
//
//  Created by Thiago de Oliveira Sousa on 05/04/22.
//

import Foundation
import SpriteKit
import UIKit
import SwiftUI

public class ChoiceScene: SKScene {
    
    let labelNameYposition: CGFloat = 300
    let imagesYposition: CGFloat = 35
    let buttonsYposition: CGFloat = -300
    let buttonsSpace: CGFloat = 150
    
    var currentChoice: Choice = .SHUTTER
    
    
    // MARK: - CHOICES
    var shutter = ChoiceModel(currentPosition: .CENTER, imageName: "Shutter_Runner")
    
    var aperture = ChoiceModel(currentPosition: .FIRSTLEFT, imageName: "Aperture_Cat")
    
    var iso = ChoiceModel(currentPosition: .FIRSTRIGHT, imageName: "ISO_Granulated")
    
    public var camereViewfinder: SKSpriteNode {
        let cameraViewfinder = SKSpriteNode(imageNamed: "CameraViewFinder")
        cameraViewfinder.setScale(Scales.normal.value())
        cameraViewfinder.zPosition = 4
        cameraViewfinder.position.y = imagesYposition
        return cameraViewfinder
    }
    
    // MARK: - BUTTONS
    lazy var nextButton = ButtonChoiceModel(imageName: "Next_Button", xPosition: buttonsSpace, yPosition: buttonsYposition)
    
    lazy var backButton = ButtonChoiceModel(imageName: "Back_Button", xPosition: -buttonsSpace, yPosition: buttonsYposition)
    
    // MARK: - IMAGES
    public var titleChoiceLable: SKLabelNode {
        
        let title = SKLabelNode(text: "Shutter" )
        title.fontSize = 50
        title.fontSize = 60
        title.fontName = "SFCompactRounded-Black"
        title.zPosition = 2
        title.position.y = labelNameYposition
        title.name = "titleChoice"
        
        return title
    }
    
    public var ClickButton: SKSpriteNode {
        let click = SKSpriteNode(imageNamed: "Click_Button")
        click.setScale(Scales.normal.value())
        click.zPosition = 3
        click.position.y = buttonsYposition
        click.name = "Click_Button"
        return click
    }

    
    public override func sceneDidLoad() {
        self.backgroundColor = SKColor(red: 255/255, green: 188/255, blue: 44/255, alpha: 1.0)
    }
    
    public override func didMove(to view: SKView) {

        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        addChild(camereViewfinder)
        addChild(ClickButton)
        addChild(nextButton.node)
        addChild(backButton.node)
        addChild(iso.node)
        addChild(shutter.node)
        addChild(aperture.node)
        addChild(titleChoiceLable)
        
        
        HiddenButtons()
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        
        for touch in touches {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            
            switch touchedNode.name {
            case "Click_Button":
                scene?.view?.presentScene(ATCManager.shared.cameraScene)
                
            case "Next_Button":
                changeNextChoice()
                HiddenButtons()
                /// remove nodes to make animation
                removeNodes()

                /// add nodes with animation
                addChild(ScrollToLeft(choice: shutter))
                addChild(ScrollToLeft(choice: aperture))
                addChild(ScrollToLeft(choice: iso))
                
            case "Back_Button":
                
                changeBackChoice()
                HiddenButtons()
                
                /// remove nodes to make animation
                removeNodes()
                
                /// add nodes with animation
                addChild(ScrollToRight(choice: shutter))
                addChild(ScrollToRight(choice: aperture))
                addChild(ScrollToRight(choice: iso))
                
            case .none:
                break
            case .some(_):
                break
            }
        }
    }
    
    private func removeNodes() {
        self.childNode(withName: "Shutter_Runner")?.removeFromParent()
        self.childNode(withName: "Aperture_Cat")?.removeFromParent()
        self.childNode(withName: "ISO_Granulated")?.removeFromParent()
    }
 
    func changeNextChoice() {
        switch currentChoice {
        case .SHUTTER:
            currentChoice = .ISO
        case .APERTURE:
            currentChoice = .SHUTTER
        case .ISO:
            currentChoice = .ISO
        }
        
        ATCManager.shared.cameraViewModel.setTitle(to: currentChoice)
    }
    
    func changeBackChoice() {
        switch currentChoice {
        case .SHUTTER:
            currentChoice = .APERTURE
        case .APERTURE:
            currentChoice = .APERTURE
        case .ISO:
            currentChoice = .SHUTTER
        }
        
        ATCManager.shared.cameraViewModel.setTitle(to: currentChoice)
    }
    
    func HiddenButtons() {
        switch currentChoice {
        case .SHUTTER:
            nextButton.node.isHidden = false
            backButton.node.isHidden = false
        case .APERTURE:
            backButton.node.isHidden = true
            nextButton.node.isHidden = false
        case .ISO:
            nextButton.node.isHidden = true
            backButton.node.isHidden = false
        }
        
        ChangeChoileLabel()
        
    }
    
    func ChangeChoileLabel() {
        if let title = self.childNode(withName: "titleChoice") as? SKLabelNode {
            switch currentChoice {
            case .SHUTTER:
                title.text = "Shutter"
            case .APERTURE:
                title.text = "Aperture"
            case .ISO:
                title.text = "ISO"
            }
        }
    }
    
}
