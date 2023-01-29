//
//  TaskCell.swift
//  CoreWork
//
//  Created by Ziloliddin Kamolov on 24/01/23.
//

import SwiftUI

struct TaskCell: View {
    @Environment(\.managedObjectContext) var moc
    var task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title!)
                    .fontWeight(.bold)
                Text(task.subtitle!)
            }
            Spacer()
            Text(task.type!)
                .foregroundColor(Color.red)
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task())
    }
}
