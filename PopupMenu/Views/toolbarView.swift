//
//  toolbarView.swift
//  PopupMenu
//
//  Created by Douglas Clarke on 1/5/23.
//

import SwiftUI

struct toolbarView: ViewModifier {
    @ObservedObject var vm:ViewModel
    
    func body(content: Content) -> some View {
        content
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    MyToolbarButton(number:2,show:$vm.show)
                    MyToolbarButton(number:3,show:$vm.show)
                    MyToolbarButton(number:4,show:$vm.show)
                    Spacer()
                    Text(String(format: "Height: %0.1f", vm.frameSize.height))
                    Spacer()
                }
            }
    }
}

extension View {
    func myToolbar(vm:ViewModel) -> some View {
        modifier(toolbarView(vm: vm))
    }
}

