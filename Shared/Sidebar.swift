//
//  Sidebar.swift
//  Design Code iOS 14
//
//  Created by Simran Preet Narang on 2022-07-21.
//

import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CoursesView()) {
                    Label("Courses", systemImage: "book.closed")
                }
                
                NavigationLink(destination: Text("Tutorials")) {
                    Label("Tutorials", systemImage: "list.bullet.rectangle")
                }
                
                NavigationLink(destination: Text("Livestreams")) {
                    Label("Livestreams", systemImage: "tv")
                }
                
                NavigationLink(destination: Text("Certificates")) {
                    Label("Certificates", systemImage: "mail.stack")
                }
                
                NavigationLink(destination: Text("Search")) {
                    Label("Search", systemImage: "magnifyingglass")
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Learn")
            
            CoursesView()
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
