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
            
            #if os(iOS)
            content
                .navigationBarHidden(true)
            fullContent
                .background(VisualEffectBlur(blurStyle: .extraLight).edgesIgnoringSafeArea(.all))
            #else
            content
            fullContent
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            #endif
        }
        .navigationTitle("Courses")
    }
    
    
    @ViewBuilder
    var content: some View {
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
    }
    
    @ViewBuilder
    var fullContent: some View {
        if let selectedItem = selectedItem {
            ZStack(alignment: .topTrailing) {
                CourseDetailView(course: selectedItem, namespace: namespace)
                CloseButton()
                    .padding(16)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            show.toggle()
                            self.selectedItem = nil
                            isDisabled = false
                        }
                    }
            }
            .zIndex(2)
            .frame(maxWidth: 712)
            .frame(maxWidth: .infinity)
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
