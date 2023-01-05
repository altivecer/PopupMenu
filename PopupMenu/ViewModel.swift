//
//  ViewModel.swift
//  PopupMenu
//
//  Created by Douglas Clarke on 1/5/23.
//

import Foundation


class ViewModel: ObservableObject {
    @Published var show = [2:true,3:true,4:true]
    @Published var showPopupMenu = false

    @Published var frameSize = CGSize.zero
    @Published var menuClickLocation = CGPoint.zero
    @Published var screenWidth:CGFloat = 0
    @Published var isPortrait:Bool = true
    init() {
        
    }
}

