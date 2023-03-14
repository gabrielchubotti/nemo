//
//  Home.swift
//  Nemo
//
//  Created by Gabriel Chu Bottiglieri on 08/03/23.
//

import SwiftUI

struct Home: View {
    
    //state variables
    @State var showColors: Bool = false
    
        //Button Animation
    
    @State var animateButton: Bool = false
    
    
    var body: some View {
        
        HStack(spacing: 0){
            
            //Side bar
            if isMacOS(){
                Group{
                    SideBar()
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 1)
                }
            }
            MainContent()
        }
        #if os(macOS)
        .ignoresSafeArea()
        #endif
        .frame(width: isMacOS() ? getRect().width / 1.7 : nil, height: isMacOS() ? getRect().height - 180 : nil, alignment: .leading)
        .background(Color.white.ignoresSafeArea())
        .preferredColorScheme(.light)
        #if os(iOS)
        overlay(SideBar())
        #endif
    }
    
    @ViewBuilder
    func MainContent()-> some View {
        VStack(spacing: 15){
            
            //Search Bar
            HStack(spacing: 10){
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                TextField("Search", text: .constant(""))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, isMacOS() ? 0 : 10)
            .overlay(
                Rectangle()
                    .fill(Color.gray.opacity(0.15))
                    .frame(height: 1)
                    .padding(.horizontal, -25)
                    .offset(y: 6),
                
                alignment: .bottom
            
            )
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 15){
                    Text("Notes")
                        .font(isMacOS() ? .system(size: 33, weight: .bold) : .largeTitle.bold())
                }
                .padding(.top, isMacOS() ?  45 : 30)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                //columns
                
                let columns = Array(repeating: GridItem(.flexible(), spacing: isMacOS() ? 25 : 15), count: isMacOS() ? 3 : 1)
                LazyVGrid(columns: columns, spacing: 25) {
                    
                    //Notes ....
                    ForEach(notes){ note in
                        CardView(note: note)
                    }
                    
                }
                .padding(.top)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top, isMacOS() ? 40 : 0)
        .padding(.horizontal, 25)
    }
    
    @ViewBuilder
    func CardView(note: Note)-> some View {
        VStack{
            Text(note.note)
                .font(isMacOS() ? .title3 : .body)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                Text(note.date, style: .date)
                    .foregroundColor(.black)
                    .opacity(0.8)
                
                Spacer(minLength: 0)
                
                Button {
                    //code
                } label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 15, weight: .bold))
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .clipShape(Circle())
                }

            }
            .padding(.top, 55)
        }
        .padding()
        .background(note.cardColor)
        .cornerRadius(18)
    }
    
    @ViewBuilder
    func SideBar()-> some View {
        VStack {
            if isMacOS(){
                Text("Pocket")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            //Add Button
            AddButton()
                .zIndex(1)
            
            VStack(spacing: 15){
                //Colors
                
                let colors = [
                    Color(#colorLiteral(red: 1, green: 0.8687317967, blue: 0.6037406921, alpha: 1)),
                    Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)),
                    Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),
                    Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)),
                    Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)),
                ]
                
                ForEach(colors,id: \.self){ color in
                    Circle()
                        .fill(color)
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.top, 20)
            .frame(height: showColors ? nil : 0)
            .opacity(showColors ? 1 : 0 )
            .zIndex(0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.vertical)
        .padding(.horizontal, 22)
        .padding(.top, 35)
    }
    
    @ViewBuilder
    func AddButton()-> some View {
        Button {
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                showColors.toggle()
                animateButton.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                withAnimation(.spring()){
                    animateButton.toggle()
                }
            }
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundStyle(.white)
                .scaleEffect(animateButton ? 1.1 : 1)
                .padding(isMacOS() ? 12 : 15)
                .background(Color.black)
                .clipShape(Circle())
        }
        .rotationEffect(.init(degrees: showColors ? 45 : 0))
        .scaleEffect(animateButton ? 1.1 : 1)
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

//Hiding focus ring
#if os(macOS)
extension NSTextField {
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
#endif
