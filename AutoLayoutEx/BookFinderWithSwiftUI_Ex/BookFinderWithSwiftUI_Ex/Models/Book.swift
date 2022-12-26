//
//  Book.swift
//  BookFinderWithSwiftUI_Ex
//
//  Created by wizard on 2022/11/10.
//

import Foundation

struct Book: Codable, Identifiable {
    var title:String
    var publisher:String
    var authors:[String]
    var thumbnail:String
    var url:String
    var price:Int
    var id:String
    
    enum CodingKeys:String, CodingKey{
        case title, publisher, authors, thumbnail, url, price
        case id = "isbn"
    }
}

struct Meta: Codable {
    var isEnd:Bool
    var pageableCount:Int
    var totalCount:Int
    
    enum CodingKeys:String, CodingKey{
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}

struct SResult: Codable {
    var meta: Meta
    var books: [Book]
    
    enum CodingKeys:String, CodingKey{
        case meta
        case books = "documents"
    }
}

let sampleBook = Book(title:  "금리의 역습", publisher: "한빛비즈", authors: [
    "윤채현", "우영우"
], thumbnail: "https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1410632%3Ftimestamp%3D20220930204552", url: "https://search.daum.net/search?w=bookpage&bookId=1410632&q=%EC%A7%80%EA%B8%88+%EB%8B%B9%EC%9E%A5+%EA%B8%88%EB%A6%AC%EA%B3%B5%EB%B6%80+%EC%8B%9C%EC%9E%91%ED%95%98%EB%9D%BC%28%EA%B2%BD%EC%A0%9C%EC%97%90+%ED%86%B5%ED%95%98%EB%8A%94+%EC%B1%85+%EC%8B%9C%EB%A6%AC%EC%A6%88+10%29", price: 18500, id: "899412019X 9788994120195")

