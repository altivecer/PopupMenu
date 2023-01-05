//
//  MenuButton.swift
//  PopupMenu
//
//  Created by Douglas Clarke on 1/5/23.
//

import SwiftUI

struct MenuButton: View {
    let action: () -> Void
    let title:String
    let show:Bool
    
    init(title:String, show:Bool, action: @escaping() -> Void) {
        self.action = action
        self.show = show
        self.title = title
    }
    
    var body: some View {
        if show {
            Button(action: action, label:{
                Text(LocalizedStringKey(title))
                    .frame(width: 200,height: 30)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(myGray, lineWidth: 2))
            })
        }
    }
}
