//
//  Home.swift
//  Nemo
//
//  Created by Gabriel Chu Bottiglieri on 08/03/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        HStack{
            if isMacOS(){
                SideBar()
            }
        }
        .frame(width: isMacOS() ? getRect().width / 1.7 : nil, height: isMacOS() ? getRect().height - 180 : nil, alignment: .leading)
        .background(Color.white.ignoresSafeArea())
        .preferredColorScheme(.light)
    }
    
    @ViewBuilder
    func SideBar()-> some View {
        VStack {
            Text("Pocket")
                .font(.title2)
                .fontWeight(.semibold)
            
            //Add Button
            AddButton()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
    
    @ViewBuilder
    func AddButton()-> some View {
        Button {
            
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundStyle(.white)
                .padding(isMacOS() ? 12: 15)
                .background(Color.black)
                .clipShape(Circle())
        }
        .padding(.top, 30)

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//Extending View to get Frame and getting device OS Types

extension View {
    func getRect() -> CGRect {
        #if os(iOS)
        return UIScreen.main.bounds
        #else
        return NSScreen.main!.visibleFrame
        #endif
    }
    
    func isMacOS()->Bool {
        #if os(iOS)
        return false
        #endif
        return true
    }
}
