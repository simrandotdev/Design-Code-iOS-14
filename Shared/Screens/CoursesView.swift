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
            ListView(isDisabled: $isDisabled, show: $show, selectedItem: $selectedItem, namespace: namespace)
            DetailsView(selectedItem: $selectedItem, namespace: namespace, isDisabled: $isDisabled, show: $show)
        }   
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}

struct ListView: View {
    
    @Binding var isDisabled: Bool
    @Binding var show: Bool
    @Binding var selectedItem: Course?
    var namespace: Namespace.ID
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(courses) { item in
                    CourseItem(course: item)
                        .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                        .frame(width: 335, height: 250)
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
            .frame(maxWidth: .infinity)
        }
    }
}

struct DetailsView: View {
    
    @Binding var selectedItem: Course?
    var namespace: Namespace.ID
    @Binding var isDisabled: Bool
    @Binding var show: Bool
    
    var body: some View {
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
