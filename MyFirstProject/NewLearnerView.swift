//
//  NewLearnerView.swift
//  MyFirstProject
//
//  Created by Giovanni Monaco on 18/10/22.
//

import SwiftUI

struct NewLearnerView: View {
    
    @ObservedObject var myData = sharedData
    
    @State var name: String = ""
    @State var surname: String = ""
    @State var description: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("name")) {
                    TextField("learner's name", text: $name)
                }
                Section(header: Text("surname")) {
                    TextField("learner's surname", text: $surname)
                }
                Section(header: Text("description")) {
                    TextField("learner's description", text: $description)
                }
            }
            .navigationTitle("New Learner")
            .toolbar {
                ToolbarItem {
                    Button {
                        addLearner(name: name, surname: surname, descrtiption: description)
                    } label: {
                        Text("Add")
                    }

                }
            }
        }
    }
    
    private func addLearner(name: String, surname: String, descrtiption: String) {
        let newLearner = Learner(name: name, surname: surname, favouriteColor: .black, description: description)
        myData.learners.append(newLearner)
        
    }
    
}

struct NewLearnerView_Previews: PreviewProvider {
    static var previews: some View {
        NewLearnerView()
    }
}
