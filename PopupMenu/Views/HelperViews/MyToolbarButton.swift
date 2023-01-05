//
//  MyToolButton.swift
//  PopupMenu
//
//  Created by Douglas Clarke on 1/5/23.
//

import SwiftUI

struct MyToolbarButton : View {
    let number:Int
    @Binding var show:[Int:Bool]
    
    var body: some View {
        Button(action: {show[number]?.toggle()})
        {
            if (show[number] ?? true)
            {
                Image(systemName:"\(number).square.fill")
            }
            else
            {
                Image(systemName:"\(number).square")
            }
        }
    }
}



