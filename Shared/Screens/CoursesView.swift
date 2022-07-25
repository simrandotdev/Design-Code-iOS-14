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
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 160), spacing: 16)
                    ],
                    spacing: 16) {
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(height: 200)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    show.toggle()
                                    selectedItem = item
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        isDisabled = true
                                    }
                                    
                                }
                            }
                            .disabled(isDisabled)
                        }
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
            }
            .zIndex(1)
            
            if let selectedItem = selectedItem {
                ZStack(alignment: .topTrailing) {
                    VStack {
                        ScrollView {
                            CourseItem(course: selectedItem)
                                .matchedGeometryEffect(id: selectedItem.id, in: namespace)
                                .frame(height: 300)
                            
                            VStack {
                                ForEach(0 ..< 25) { item in
                                    CourseRow()
                                }
                            }
                            .padding()
                        }
                    }
                    .background(Color("Background 1"))
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .matchedGeometryEffect(id: "container\(selectedItem.id)", in: namespace)
                    .edgesIgnoringSafeArea(.all)
                    
                    
                    CloseButton()
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                show.toggle()
                                self.selectedItem = nil
                                isDisabled = false
                            }
                        }
                        .padding()
                }
                .zIndex(2)
            }
            
        }
        
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
