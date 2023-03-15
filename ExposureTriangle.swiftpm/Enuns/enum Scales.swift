//
//  enum Scales.swift
//  CameraWWDC
//
//  Created by Thiago de Oliveira Sousa on 06/04/22.
//

import Foundation
import SpriteKit

enum Scales {
    case normal
    case secondaryScale
    
    func value() -> CGFloat{
        switch self {
        case .normal:
            return 0.7
        case .secondaryScale:
            return 0.2
        }
    }

}
