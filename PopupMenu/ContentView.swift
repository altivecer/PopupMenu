//
//  ContentView.swift
//  PopupMenu
//
//  Created by Douglas Clarke on 1/4/23.
//

import SwiftUI

let myGray = Color(red:0.8, green:0.8, blue:0.8)


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
                .background(Color.yellow)
                
                PopupMenuView(vm:vm)
             }
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    MyButton(number:2,show:$vm.show)
                    MyButton(number:3,show:$vm.show)
                    MyButton(number:4,show:$vm.show)
                    Spacer()
                    Text(String(format: "Height: %0.1f", vm.frameSize.height))
                    Spacer()
                }
            }
            .padding(5)
            .onAppear{
                let orientation = UIDevice.current.orientation
                if (orientation.isPortrait)
                {
                    vm.screenWidth = min(UIScreen.main.bounds.size.width,UIScreen.main.bounds.size.height)
                    vm.isPortrait = true
                }
                else
                {
                    vm.screenWidth = max(UIScreen.main.bounds.size.width,UIScreen.main.bounds.size.height)
                    vm.isPortrait = false
                }
            }
            .onRotate { orientation in
                if (orientation.isPortrait)
                {
                    vm.screenWidth = min(UIScreen.main.bounds.size.width,UIScreen.main.bounds.size.height)
                    vm.isPortrait = true
                }
                if (orientation.isLandscape)
                {
                    vm.screenWidth = max(UIScreen.main.bounds.size.width,UIScreen.main.bounds.size.height)
                    vm.isPortrait = false
                }
            }
        }
    }
}

struct MeasureSizeModifier: ViewModifier {
    let callback: (CGSize) -> Void
    
    func body(content: Content) -> some View {
        content
            .background{
                GeometryReader { proxy in
                    Color.clear
                        .onAppear{
                            callback(proxy.size)
                        }
                        .onChange(of: proxy.size) { size in
                            callback(proxy.size)
                        }
                }
            }
    }
}

extension View {
    func measureSize(_ callback: @escaping (CGSize) -> Void) -> some View {
        modifier(MeasureSizeModifier(callback: callback))
    }
}

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
