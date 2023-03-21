//
//  Profile.swift
//  Nemo
//
//  Created by Gabriel Chu Bottiglieri on 16/03/23.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack(spacing: 5){
            Image(systemName: "person")
                .font(.largeTitle)
                .foregroundColor(Color.black)
            Text("Nemo Dory")
            
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
