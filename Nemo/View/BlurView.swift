//
//  BlurView.swift
//  Nemo
//
//  Created by Gabriel Chu Bottiglieri on 12/03/23.
//
#if os(iOS)
import SwiftUI

struct BlurView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
#endif

