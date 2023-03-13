//
//  Note.swift
//  Nemo
//
//  Created by Gabriel Chu Bottiglieri on 12/03/23.
//

import SwiftUI


//note model

struct Note: Identifiable {
    var id = UUID().uuidString
    var note: String
    var date: Date
    var cardColor: Color
}

func getSampleDate(offset: Int)->Date{
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}


var notes: [Note] = [

Note (note: "The beginning of screenless design UI jobs to be taken...", date:
getSampleDate(offset: 1), cardColor: Color(#colorLiteral(red: 1, green: 0.8687317967, blue: 0.6037406921, alpha: 1))),
Note (note: "13 Things You Should Give Up If You Want To Be a Successful UX Designer", date:
getSampleDate(offset: -10), cardColor: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))),
Note (note: "The Psychology Principles Every UI/UX Designer Needs to Know", date:
getSampleDate(offset: -15), cardColor: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
Note (note: "52 Research Terms you need to know as a UX Designer", date:
getSampleDate(offset: 10), cardColor: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))),
Note (note: "10 UI & UX Lessons from Designing My Own Product", date: getSampleDate(offset:
-3), cardColor: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
]
