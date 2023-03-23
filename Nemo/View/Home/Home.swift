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
            
            VStack(spacing: 30){
                DailyMotivationView()
                
                Spacer()
                
                ContributionChartView(data: [0,3,4,2,4,2,5,1,3,0,3,4,2,4,2,5,1,3,0,3,4,2,4,2,5,1,3,0,3,4,2,4,2,5,1,3,0,3,4,2,4,2,5,1,3,0,3,4,2,4,2,5,1,3,0,3,4,2,4,2,5,1,3,0,3,4,2,4,2,5], rows: 7, columns: 10, targetValue: 5)
                
                Spacer()
                
                AchievementsView()
                    .frame(width: 300, height: 200)
            }
        }
    }
}
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
