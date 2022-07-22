//
//  CoursesView.swift
//  Design Code iOS 14
//
//  Created by Simran Preet Narang on 2022-07-20.
//

import SwiftUI

struct CoursesView: View {
    
    @State var show = false
    
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            CourseItem()
                .matchedGeometryEffect(id: "Card", in: namespace, isSource: !show)
                .frame(width: 335, height: 250)
            
            if show {
                ScrollView {
                    CourseItem()
                        .matchedGeometryEffect(id: "Card", in: namespace)
                        .frame(height: 300)
                        .transition(.slide)
                    
                    VStack {
                        ForEach(0 ..< 25) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                }.ignoresSafeArea()
            }
            
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
