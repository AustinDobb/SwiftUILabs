//
//  CreateToNewView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Austin Dobberfuhl on 1/23/24.
//

import SwiftUI

struct CreateToNewView: View {
    @Environment (\.dismiss) var dismiss
    
    @ObservedObject var todosController: TodosController
    
    @State var newTodoText = ""
    @State var selectedSection: TodoSection
    
    init(todoController: TodosController) {
        _todosController = ObservedObject(wrappedValue: todoController)
        _selectedSection = State(initialValue: todoController.sections[0])
    }
    
    var body: some View {
        VStack {
            Text("Create New Todo")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding(.top)
            
            Spacer()
            
            HStack {
                TextField("Todo", text: $newTodoText)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, style: StrokeStyle(lineWidth: 0.2))
                    )
                    .padding()
                VStack {
                    Picker("For Section", selection: $selectedSection) {
                        ForEach(todosController.sections, id: \.self) { section in
                            Text(section.sectionTitle)
                            
                        }
                    }
                    
                    NavigationLink {
                        AddingNewSectionView(section: $todosController.sections)
                    } label: {
                        Text("+")
                    }
                }
                .padding()
            }
            
            Spacer()
            
            VStack {
                Button(action: {
                    if !newTodoText.isEmpty {
                        addNewTodo(newTodoText, for: selectedSection)
                        dismiss()
                    }
                }, label: {
                    Text("Create")
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
                    
                })
                
                Button(action: {
                        dismiss()
                    }
                       , label: {
                    Text("Cancel")
                        .foregroundStyle(Color.red)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                            .stroke(.red))
                    
                })
            }
            .padding()
        }
        .toolbar(.hidden)
    }
    
    func addNewTodo(_ todoTitle: String, for section: TodoSection) {
        if let sectionIndex = todosController.sections.firstIndex(where: { $0 == section }) {
            todosController.sections[sectionIndex].todos.append(Todo(markedComplete: false, title: todoTitle))
        }
    }
    
    
}
#Preview {
    CreateToNewView(todoController: TodosController())
}
