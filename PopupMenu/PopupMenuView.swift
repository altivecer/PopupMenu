//
//  PopupMenuView.swift
//  PopupMenu
//
//  Created by Douglas Clarke on 1/5/23.
//

import SwiftUI

struct PopupMenuView: View {
    @ObservedObject var vm:ViewModel

    var body: some View {

        ZStack (alignment: .top) {
            if vm.showPopupMenu
            {
                RoundedRectangle(cornerRadius: 12) // This is the background of the popup menu
                    .fill(Color.white)
                    .overlay {
                        VStack (spacing: 15) {
                            MenuButton(title: "1", show: true, action: {vm.showPopupMenu = false })
                            MenuButton(title: "2", show:vm.show[2] ?? true, action: {vm.showPopupMenu = false })
                            MenuButton(title: "3", show:vm.show[3] ?? true, action: {vm.showPopupMenu = false })
                            MenuButton(title: "4", show:vm.show[4] ?? true, action: {vm.showPopupMenu = false })
                        }
                        .padding(15)
                        .measureSize{ size in  // This figures out how tall the menu is
                            vm.frameSize = size
                        }
                    }
                    .overlay(RoundedRectangle(cornerRadius: 14) // Create the boarder around the menu
                        .stroke(myGray, lineWidth: 2))
                    .padding(0) // Remove padding between the boarder and the outside of the menu
                    .frame(width: vm.frameSize.width, height: vm.frameSize.height) // place the menu on the screen
            }
        }

        .offset(x:min(max(vm.menuClickLocation.x - CGFloat(vm.isPortrait ? 7:63) - vm.frameSize.width/2,10),vm.screenWidth - vm.frameSize.width - CGFloat(vm.isPortrait ? 20:140)),
                    y:max(vm.menuClickLocation.y - CGFloat(vm.isPortrait ? 60.0:0.0) - vm.frameSize.height - 20 , 10.0))
    }
}

struct PopupMenuView_Previews: PreviewProvider {
    static var previews: some View {
        PopupMenuView(vm:ViewModel())
    }
}
