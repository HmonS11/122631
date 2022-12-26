//
//  BookList.swift
//  BookFinderWithSwiftUI_Ex
//
//  Created by wizard on 2022/11/10.
//

import SwiftUI
import Alamofire
struct BookList: View {
    @State var books:[Book] = []
    @State var query:String = ""
    @State var page = 1
    @State var isEnd = true
    
    var body: some View {
        NavigationView {
            VStack{
                SearchBar(searchText: $query) {
                   search()
                }
                List(books) { book in
                    NavigationLink {
                        WebView(strURL: book.url)
                    } label: {
                        BookCell(book: book)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("책검색")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            page -= 1
                            search()
                        } label: {
                            Image(systemName: "arrow.left")
                        }
                        .disabled( page <= 1 )
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            page += 1
                            search()
                        } label: {
                            Image(systemName: "arrow.right")
                        }
                        .disabled(isEnd)
                    }
                }
            }
        }
    }
    
    func search(){
        let apiKey = "KakaoAK 4cae53176045f8acd298a788ea85b153"
        let strURL = "https://dapi.kakao.com/v3/search/book"
        
        let params:Parameters = ["query":query, "page":page]
        let headers:HTTPHeaders = ["Authorization":apiKey]
        
        let alamo = AF.request(strURL, method: .get, parameters: params, headers: headers)
        
        alamo.responseDecodable(of: SResult.self) { response in
            switch response.result {
                case .success(let sResult):
                    
                    books = sResult.books
                    isEnd = sResult.meta.isEnd
                    
                case .failure(let error):
                    print("파싱 실패 \(error.errorDescription ?? "")")
            }
        }
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
    }
}
