//
//  CoursesView.swift
//  Design Code iOS 14
//
//  Created by Simran Preet Narang on 2022-07-20.
//

import SwiftUI

struct CoursesView: View {
    var body: some View {
        List(0 ..< 25) { item in
            CourseRow()
        }
        .listStyle(.insetGrouped)
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
