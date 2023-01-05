//
//  ContentView.swift
//  PopupMenu
//
//  Created by Douglas Clarke on 1/4/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm:ViewModel = ViewModel()
    
    var body: some View {
        NavigationStack  {
            ZStack (alignment: .topLeading) {
                VStack {
                    Spacer()
                    ThingToClickOn(vm:vm, line:"first")
                    Spacer()
                    ThingToClickOn(vm:vm, line:"second")
                    Spacer()
                    ThingToClickOn(vm:vm, line:"third")
                    Spacer()
                    ThingToClickOn(vm:vm, line:"fourth line which is a very long line so that it goes the whole width of the screen showing a ")
                    Spacer()
                }
                .background(Color.white)
                PopupMenuView(vm:vm)
             }
            .myToolbar(vm:vm)
            .padding(5)
            .onAppear{
                vm.setOrientation(orientation:UIDevice.current.orientation)
            }
            .onRotate { orientation in
                vm.setOrientation(orientation:orientation)
            }
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
