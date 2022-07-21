//
//  ContentView.swift
//  Shared
//
//  Created by Simran Preet Narang on 2022-07-20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            HStack {
                
                Spacer()
                Image("Illustration 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
            Text("SwiftUI for iOS 14")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            
            Text("20 Sections")
                .font(.footnote)
                .foregroundColor(Color.white)
            
            
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .background(Color.blue)
        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .frame(width: 200.0, height: 200.0)
        }
    }
}
