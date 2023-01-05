//
//  ViewModel.swift
//  PopupMenu
//
//  Created by Douglas Clarke on 1/5/23.
//

import Foundation
import SwiftUI

let myGray = Color(red:0.8, green:0.8, blue:0.8)

class ViewModel: ObservableObject {
    @Published var show = [2:true,3:true,4:true]
    @Published var showPopupMenu = false
    
    @Published var frameSize = CGSize.zero
    @Published var menuClickLocation = CGPoint.zero
    @Published var screenWidth:CGFloat = 0
    @Published var isPortrait:Bool = true
    
    init() { }
    
    func setOrientation(orientation:UIDeviceOrientation) {
        if (orientation.isPortrait)
        {
            screenWidth = min(UIScreen.main.bounds.size.width,UIScreen.main.bounds.size.height)
            isPortrait = true
        }
        if (orientation.isLandscape)
        {
            screenWidth = max(UIScreen.main.bounds.size.width,UIScreen.main.bounds.size.height)
            isPortrait = false
        }
    }
}

