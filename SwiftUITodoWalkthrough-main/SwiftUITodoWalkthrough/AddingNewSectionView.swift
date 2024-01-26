//
//  AddingNewSectionView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Austin Dobberfuhl on 1/23/24.
//

import SwiftUI

struct AddingNewSectionView: View {
    @Environment (\.dismiss) var dismiss
    @Binding var section: [TodoSection]
    
    @State var newSectionText = ""

    
    
    var body: some View {
        VStack {
            Text("Create new section")
                .font(.largeTitle)
                .fontWeight(.thin)
                .padding(.top)
            
            Spacer()
            
            HStack {
                TextField("Section", text: $newSectionText)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, style: StrokeStyle(lineWidth: 0.2))
                    )
                    .padding()
                
            }
            Spacer()
        }
        
        VStack {
            Button(action: {
                addNewSection()
                }
            , label: {
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
    
    //add another sectionTitle since the picker shows them. 
    func addNewSection() {
        if !newSectionText.isEmpty {
            let newSection = TodoSection(sectionTitle: newSectionText, todos: [])
            section.append(newSection)
            dismiss()
        }
    }
    
}


    

