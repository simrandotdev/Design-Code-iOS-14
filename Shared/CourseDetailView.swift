//
//  CourseDetailView.swift
//  Design Code iOS 14
//
//  Created by Simran Preet Narang on 2022-07-24.
//

import SwiftUI

struct CourseDetailView: View {
    
    var course: Course = courses[0]
    var namespace: Namespace.ID
    
#if os(iOS)
    var cornerRadious: CGFloat = 12
#else
    var cornerRadious: CGFloat = 0
#endif
    
    var body: some View {
        
        #if os(iOS)
        content
            .edgesIgnoringSafeArea(.all)
        #else
        content
        #endif
    }
    
    var content: some View {
        VStack {
            ScrollView {
                CourseItem(course: course, cornerRadious: 0)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height: 300)
                
                VStack {
                    ForEach(courseSections) { item in
                        CourseRow(item: item)
                        Divider()
                    }
                }
                .padding()
            }
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadious, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        CourseDetailView(namespace: namespace)
    }
}
