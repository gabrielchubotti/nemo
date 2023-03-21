//
//  Achievements.swift
//  Nemo
//
//  Created by Gabriel Chu Bottiglieri on 20/03/23.
//

import SwiftUI

struct AchievementsView: View {
    var body: some View {
        
        //create view that contains small squares for each day that get colored as days go by 
        RoundedRectangle(cornerRadius: 25)
            .frame(maxWidth: 400, maxHeight: 260)
            .foregroundColor(Color.blue)
    }
}

struct Achievements_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView()
    }
}
