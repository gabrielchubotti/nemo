//
//  DailyMotivationView.swift
//  Nemo
//
//  Created by Gabriel Chu Bottiglieri on 20/03/23.
//

import SwiftUI

struct DailyMotivationView: View {
    var body: some View {
        Text("Success is not final, failure is not fatal: It is the courage to continue that counts. – Winston Churchill")
            .font(.body)
            .bold()
            .foregroundColor(.primary)
             .frame(width: 300, height: 90)
             .background(RoundedRectangle(cornerRadius: 20).fill(Color(red: 250, green: 250, blue: 250)).shadow(radius: 3))
             .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 4).foregroundColor(Color(red: 245, green: 245, blue: 245)))
        
    }
}

struct DailyMotivationView_Previews: PreviewProvider {
    static var previews: some View {
        DailyMotivationView()
    }
}
