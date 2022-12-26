//
//  SearchBar.swift
//  BookFinderWithSwiftUI_Ex
//
//  Created by wizard on 2022/11/10.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText:String
    @State var isEditing = false
    var action:()->()
    
    var body: some View {
        HStack{
            TextField("검색어를 입력하세요.", text: $searchText)
                .padding(10)
                .padding(.leading)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 10)
                .onTapGesture {
                    isEditing = true
                }
                .onSubmit {
                    action()
                }
            
            if isEditing {
                Button {
                    isEditing = false
                    searchText = ""
                } label: {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant("가을")){
            
        }
    }
}
