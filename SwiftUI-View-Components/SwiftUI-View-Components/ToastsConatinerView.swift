//
//  ToastsConatinerView.swift
//  SwiftUI-View-Components
//
//  Created by Daniel Ayala on 22/3/23.
//

import SwiftUI
import ToastLauncher

struct ToastsConatinerView: View {
    @State var isPresentingView: Bool = false
    @State var isPresentingView2: Bool = false
    @State var viewAlignment: Alignment = .top
    @State var animationStart: AnyTransition = .move(edge: .top)
    @State var animationEnd: AnyTransition = .opacity
    @State private var toastStyle: ToastView.ToastViewStyle = .auto
    
    var body: some View {
        ZStack() {
            Color.orange
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Button(action: {
                    self.viewAlignment = .center
                    self.animationStart = .opacity
                    self.animationEnd = .opacity
                    self.toastStyle = .prominent
                    didTapShowToastView()
                }, label: {
                    Text("Show Pop Up View 🚀")
                })
                Button(action: {
                    self.viewAlignment = .top
                    self.animationStart = .move(edge: .top)
                    self.animationEnd = .move(edge: .top)
                    self.toastStyle = .auto
                    didTapShowToastView()
                }, label: {
                    Text("🆙 Show Top Toast View 🚀")
                })
                Button(action: {
                    self.viewAlignment = .bottom
                    self.animationStart = .move(edge: .bottom)
                    self.animationEnd = .move(edge: .bottom)
                    self.toastStyle = .auto
                    didTapShowToastView()
                }, label: {
                    Text("⬇️ Show Bottom Toast View 🚀")
                })
                Button(action: {
                    self.viewAlignment = .leading
                    self.animationStart = .move(edge: .leading)
                    self.animationEnd = .move(edge: .trailing)
                    self.toastStyle = .auto
                    didTapShowToastView()
                }, label: {
                    Text("⬅️ Show Leading Toast View 🚀")
                })
                Button(action: {
                    self.viewAlignment = .trailing
                    self.animationStart = .move(edge: .trailing)
                    self.animationEnd = .move(edge: .leading)
                    self.toastStyle = .auto
                    didTapShowToastView()
                }, label: {
                    Text("➡️ Show Trailing Toast View 🚀")
                })
            }
            .disabled(isPresentingView || isPresentingView2)
            .buttonStyle(.bordered)
        }
        .toastView(isPresented: $isPresentingView,
                   alignment: viewAlignment,
                   animationStart: animationStart,
                   animationEnd: animationEnd,
                   content: {
            ToastView(style: toastStyle, onDismiss: { dismissToastView() }) })
    }
    
    private func didTapShowToastView() {
        withAnimation(.easeOut) {
            isPresentingView = true
        }
    }
    
    private func dismissToastView() {
        withAnimation(.easeInOut) {
            isPresentingView = false
        }
    }
    
    private func dismissToastView2() {
        withAnimation(.easeInOut) {
            isPresentingView2 = false
        }
    }
    
    private func didTapSlideView() {
        withAnimation(.easeOut) {
            isPresentingView2 = true
        }
    }
    
}

struct ToastsConatinerView_Previews: PreviewProvider {
    static var previews: some View {
        ToastsConatinerView()
    }
}
