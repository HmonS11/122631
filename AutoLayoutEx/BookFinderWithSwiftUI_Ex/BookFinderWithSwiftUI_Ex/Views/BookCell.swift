//
//  BookCell.swift
//  BookFinderWithSwiftUI_Ex
//
//  Created by wizard on 2022/11/10.
//

import SwiftUI

struct BookCell: View {
    var book:Book
    var body: some View {
        HStack {
            ThumbnailView(urlStr: book.thumbnail)
            InfoView(book: book)
        }
    }
}

struct BookCell_Previews: PreviewProvider {
    static var previews: some View {
        BookCell(book: sampleBook)
    }
}

struct ThumbnailView: View {
    var urlStr: String
    var body: some View {
        AsyncImage(url: URL(string: urlStr)) { phase in
            switch phase {
                case .empty: ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(2/3, contentMode: .fit)
                        .frame(width: 80)
                case .failure:
                    EmptyView()
                @unknown default:
                    EmptyView()
            }
        }
    }
}

struct InfoView: View {
    var book:Book
    var body: some View {
        VStack (alignment: .leading, spacing: 5){
            Text(book.title)
                .font(.title)
                .lineLimit(2)
            Text(book.authors.joined(separator: ", "))
                .font(.title2)
                .lineLimit(1)
            
            HStack(alignment: .bottom) {
                Text(book.publisher)
                    .font(.title3)
                Spacer()
                Text("\(book.price)원")
                    .foregroundColor(.red)
            }
        }.padding(.leading)
    }
}
