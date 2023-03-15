//
//  enum ChoicePosition.swift
//  CameraWWDC
//
//  Created by Thiago de Oliveira Sousa on 06/04/22.
//

import Foundation
import SpriteKit

enum ChoicePosition {
    case SECONDLEFT
    case FIRSTLEFT
    case CENTER
    case FIRSTRIGHT
    case SECONDRIGHT
    
    func positon() -> CGFloat {
        switch self {
        case .SECONDLEFT:
            return -700
        case .FIRSTLEFT:
            return -500
        case .CENTER:
            return 0
        case .FIRSTRIGHT:
            return 500
        case .SECONDRIGHT:
            return 700
        }
    }
    
}
