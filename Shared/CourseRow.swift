//
//  CourseRow.swift
//  Design Code iOS 14
//
//  Created by Simran Preet Narang on 2022-07-20.
//

import SwiftUI

struct CourseRow: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "paperplane.circle.fill")
                .renderingMode(.template)
                .frame(width: 48, height: 48)
                .imageScale(.medium)
                .background(.blue)
                .clipShape(Circle())
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 4) {
                Text("SwiftUI")
                    .font(.subheadline)
                    .bold()
                Text("Description")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .font(.largeTitle)
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
    }
}
