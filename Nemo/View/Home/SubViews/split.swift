//
//  split.swift
//  Nemo
//
//  Created by Gabriel Chu Bottiglieri on 21/04/23.
//

import SwiftUI

struct Split: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    var isTip0: Bool {
        if tipPercentage == 4 {
            return true
        } else {
            return false
        }
    }
    
    let percentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(percentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        //the line of code indicates that if checkAmount cannot be converted into a Double it will automatically become 0.
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        
        return amountPerPerson
    }
    
    var grandTotal: Double {
        return Double(checkAmount) ?? 0
    }
    
    var tipValue: Double {
        let tipSelection = Double(percentages[tipPercentage])
        let tip = grandTotal / 100 * tipSelection
        return tip
    }
    
    var body: some View {
        
        NavigationView{
            Form{
                Section{
                    TextField("Enter amount..", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2 ..< 100){ i in
                            Text("\(i) people")
                        }
                    }
                }
                Section(header:Text("How much tip do you want to leave?")){
                    Picker("Percentage", selection: $tipPercentage){
                        ForEach(0 ..< percentages.count){ number in
                            Text("\(self.percentages[number])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header:Text("Amount per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                        .foregroundColor(isTip0 ? .red : .black)
                }
                
                Section(header: Text("Total Amount + Tip")){
                    Text("Grand total is: $\(grandTotal, specifier: "%.2f") and tip $\(tipValue, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
    
}

struct Split_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
