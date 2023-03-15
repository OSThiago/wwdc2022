//
//  CameraViewModel.swift
//  WWDC2022
//
//  Created by Thiago de Oliveira Sousa on 07/04/22.
//

import Foundation
import SpriteKit
import SwiftUI


class CameraViewModel {
    
    lazy var numberLabel: String = ""
    
    var currentNumber = 0
    
    var currentChoice: Choice = .SHUTTER
    
    let shutters: [String] = ["8s", "1s", "1:8s", "1:15s", "1:60s", "1:125s", "1:250s", "1:1000s"]
    
    let isos: [String] = ["100","200","400","800","1600","3200","6400","12800"]
    
    let apertures: [String] = ["1.8", "2.8", "4.0", "5.6", "8", "11", "16", "22"]
    
    
    func nextButtonAction(label: SKLabelNode) {
        
        var newText: String = ""
        
        switch currentChoice {
        case .SHUTTER:
            newText = nextShutter()
        case .APERTURE:
            newText = nextAperture()
        case .ISO:
            newText = nextISO()
        }
        
        label.text = newText
        
    }
    
    func backButtonAction(label: SKLabelNode) {
        
        var newText: String = ""
        
        switch currentChoice {
        case .SHUTTER:
            newText = backShutter()
        case .APERTURE:
            newText = backAperture()
        case .ISO:
            newText = backISO()
        }
        
        label.text = newText
        
    }
    
    func setTitle(to newChoice: Choice) {
        currentChoice = newChoice
    }
    
    // MARK: - NEXT
    private func nextShutter() -> String {
        let max = shutters.count - 1
        if currentNumber < max {
            currentNumber += 1
            numberLabel = shutters[currentNumber]
        }
        return "\(numberLabel)"
    }
    
    private func nextAperture() -> String{
        let max = apertures.count - 1
        if currentNumber < max {
            currentNumber += 1
            numberLabel = apertures[currentNumber]
        }
        return numberLabel
    }
    
    private func nextISO() -> String{
        let max = isos.count - 1
        if currentNumber < max {
            currentNumber += 1
            numberLabel = isos[currentNumber]
        }
        return numberLabel
    }
    
    // MARK: - BACK
    private func backShutter() -> String {
        let min = 0
        if currentNumber > min {
            currentNumber -= 1
            numberLabel = shutters[currentNumber]
        }
        return "\(numberLabel)"
    }
    
    private func backAperture() -> String {
        let min = 0
        if currentNumber > min {
            currentNumber -= 1
            numberLabel = apertures[currentNumber]
        }
        return numberLabel
    }
    
    private func backISO() -> String{
        let min = 0
        if currentNumber > min {
            currentNumber -= 1
            numberLabel = isos[currentNumber]
        }
        return numberLabel
    }
    
    func setupScene() {
        currentNumber = 0
        switch currentChoice {
        case .SHUTTER:
            numberLabel = shutters[0]
        case .APERTURE:
            numberLabel = apertures[0]
        case .ISO:
            numberLabel = isos[0]
        }
    }
    
}
