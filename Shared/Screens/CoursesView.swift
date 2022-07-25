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
                        CourseItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                        .frame(height: 200)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                show.toggle()
                                selectedItem = item
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    isDisabled = true
                                }
                                
                            }
                        }
                        .disabled(isDisabled)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
            }
            
            if let selectedItem = selectedItem {
                ScrollView {
                    CourseItem(course: selectedItem)
                        .matchedGeometryEffect(id: selectedItem.id, in: namespace)
                        .frame(height: 300)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                show.toggle()
                                self.selectedItem = nil
                                isDisabled = false
                            }
                        }
                    
                    VStack {
                        ForEach(0 ..< 25) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                }
                .background(Color("Background 1"))
                .transition(
                    .asymmetric(
                        insertion:  AnyTransition.opacity.animation(Animation.spring().delay(0.3)),
                        removal: AnyTransition.opacity.animation(Animation.spring())
                    )
                )
                .ignoresSafeArea()
            }
            
        }
        
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
