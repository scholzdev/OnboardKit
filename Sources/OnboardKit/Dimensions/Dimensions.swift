import SwiftUI

struct iPhoneDimensions {
    static let screenHeight = UIScreen.main.bounds.height
    
    static var spacing: CGFloat {
        if UIScreen.main.nativeBounds.height == 2340 || screenHeight < 736 { // iPhone mini, Smaller than iPhone plus
            return 30
        } else { // The rest
            return 60
        }
    }
    
    static var topPadding: CGFloat {
        if screenHeight == 568 { // iPhone SE 1st gen
            return 50
        } else if screenHeight <= 736 { // Smaller than iPhone plus
            return 60
        } else { // The rest
            return 80
        }
    }
    
    static var horizontalPaddingAddend: CGFloat {
        if screenHeight * UIScreen.main.nativeScale >= 896 * 3 || screenHeight == 736 { // iPhone pro max, iPhone plus
            return 20
        } else if screenHeight == 568 { // iPhone SE 1st gen
            return -10
        } else { // The rest
            return 0
        }
    }
}

struct iPadSheetDimensions {
    static var width: CGFloat {
        let width = UIScreen.main.bounds.width
        
        if width >= 1024 { // iPad pro 12.9"
            return width / 1.65
        } else if width == 744 || width == 768 { // iPad mini (6th gen), older iPads
            return width / 1.2
        } else if width > 810 { // iPads bigger than standard iPad
            return width / 1.35
        } else { // The rest
            return width / 1.3
        }
    }
    
    static var height: CGFloat {
        let height = UIScreen.main.bounds.height
        
        if height >= 1366 { // iPad pro 12.9"
            return height / 1.65
        } else if height == 1133 { // iPad mini (6th gen)
            return height / 1.7
        } else if height > 1080 { // iPads bigger than standard iPad
            return height / 1.6
        } else { // The rest
            return height / 1.5
        }
    }
}
