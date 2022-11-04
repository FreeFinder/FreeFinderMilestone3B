//
//  CreateItemView.swift
//  FreeFinderMilestone3B
//
//  Created by Ellen Chen on 11/3/22.
//

import SwiftUI

struct CreateItemView: View {
    enum Category: String, CaseIterable, Identifiable {
        case food
        case clothing
        case furniture
        case other
        var id: String { self.rawValue }
    }
    @State var category: Category = .food
    @State var title: String = ""
    @State var location: String = ""
    @State var description: String = ""
    @State var image: String = ""
    
    var body: some View {
        NavigationView{
            Form( content:{
                Section{
                    // TODO: image upload
                    TextField("Image", text: $image)
                }
                Section{
                    TextField("Title", text: $title)
                }
                Section{
                    TextField("Location", text: $location)
                }
                Section(header: Text("Category")){
                    Picker("Category", selection: $category) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue.capitalized).tag(category)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    TextField("Description", text: $description)
                }
                .frame(width: 200, height: 150)
                
                Section{
                    Button(action: {
                        
                    }) {
                        HStack {
                            Spacer()
                            Text("Post!")
                            Spacer()
                        }
                    }
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.accentColor)
                    .cornerRadius(8)
//                    .frame(width: 100, alignment: .trailing)
                }
            })
            .navigationBarTitle("Create Item")
        }
    }
}

struct CreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreateItemView()
    }
}
