//
//  DetailScreen.swift
//  CoreWork
//
//  Created by Ziloliddin Kamolov on 24/01/23.
//

import SwiftUI

struct DetailScreen: View {
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    
    @State var title: String = ""
    @State var subtitles: String = ""
    @State var type: String = ""
    let types = ("#doing", "#done")
    
    func saveTask(title: String, subtitle: String, type: String) {
        let task = Task(context: self.moc)
        task.id = UUID()
        task.title = title
        task.subtitle = subtitle
        task.type = type
        try? self.moc.save()
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Subtitle", text: $subtitles)
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                saveTask(title: title, subtitle: subtitles, type: type)
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("Add")
            }))
            .navigationBarTitle("Add task", displayMode: .inline)
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}
