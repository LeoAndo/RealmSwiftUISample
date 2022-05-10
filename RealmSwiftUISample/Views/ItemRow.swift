//
//  ItemRow.swift
//  RealmSwiftUISample
//
//  Created by LeoAndo on 2022/05/11.
//

import SwiftUI
import RealmSwift

/// リスト内のアイテムを表示するView
struct ItemRow: View {
    @ObservedRealmObject var item: Item

    var body: some View {
        // リスト内の項目をクリックすると、詳細の編集画面に遷移する
        NavigationLink(destination: ItemDetailsView(item: item)) {
            Text(item.name)
            if item.isFavorite {
                // ユーザーがアイテムを「お気に入り」にした場合は、ハートのアイコンを表示
                Image(systemName: "heart.fill")
            }
        }
    }
}

