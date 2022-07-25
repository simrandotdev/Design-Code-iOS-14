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
    
    
    var body: some View {
        VStack {
            ScrollView {
                CourseItem(course: course)
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
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        CourseDetailView(namespace: namespace)
    }
}
