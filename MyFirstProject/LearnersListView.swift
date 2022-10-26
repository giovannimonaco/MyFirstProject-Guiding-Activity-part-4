//
//  LearnersListView.swift
//  MyFirstProject
//
//  Created by Giovanni Monaco on 17/10/22.
//

import SwiftUI

struct LearnersListView: View {
    
    @ObservedObject var myData = sharedData
    @State var newLearnerViewisPresented = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(myData.learners) { learner in
                    NavigationLink(destination: LearnerDetailView(learner: learner)) {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(learner.favouriteColor)
                            Text(learner.name + " " + learner.surname)
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Learners")
            .sheet(isPresented: $newLearnerViewisPresented) {
                NewLearnerView()
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        newLearnerViewisPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
        }
    }
    
    func delete(at offsets: IndexSet) {
        myData.learners.remove(atOffsets: offsets)
    }
}

struct LearnersListView_Previews: PreviewProvider {
    static var previews: some View {
        LearnersListView()
    }
}
