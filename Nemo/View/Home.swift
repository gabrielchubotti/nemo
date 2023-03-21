//
//  Home.swift
//  Nemo
//
//  Created by Gabriel Chu Bottiglieri on 20/03/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                Text("Welcome, Gabriel!")
                    .font(.largeTitle.bold())
            }
            .padding(30)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            DailyMotivationView()
            
            AchievementsView()
                .frame(width: 300, height: 200)
        }
    }
}
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
