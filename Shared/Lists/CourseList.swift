//
//  CourseList.swift
//  Design Code iOS 14
//
//  Created by Simran Preet Narang on 2022-07-22.
//

import SwiftUI

struct CourseList: View {
    var body: some View {
        
#if os(iOS)
        content
            .listStyle(.insetGrouped)
#else
        content
            .frame(minWidth: 800, minHeight: 600)
#endif
    }
    
    var content: some View {
        List(0 ..< 25) { item in
            CourseRow()
        }
        .navigationTitle("Courses")
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
