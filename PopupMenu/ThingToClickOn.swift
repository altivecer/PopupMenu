//
//  ThingToClickOn.swift
//  PopupMenu
//
//  Created by Douglas Clarke on 1/5/23.
//

import SwiftUI

struct ThingToClickOn: View {
    @ObservedObject var vm:ViewModel
    let line:String
    
    var body: some View {
        Text("This is the " + line + " line of text to clcik on")
            .onTapGesture(coordinateSpace:.global) { location in
                vm.showPopupMenu.toggle()
                vm.menuClickLocation = location
            }
            .frame(maxWidth: .infinity)
    }
}

struct ThingToClickOn_Previews: PreviewProvider {
    static var previews: some View {
        ThingToClickOn(vm:ViewModel(), line:"first")
    }
}
