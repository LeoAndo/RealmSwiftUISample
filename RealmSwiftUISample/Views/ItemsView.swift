//
//  ItemsView.swift
//  RealmSwiftUISample
//
//  Created by LeoAndo on 2022/05/11.
//

import SwiftUI
import RealmSwift

// グループ内のアイテムのリストを含む画面。 グループ内のアイテムを追加、移動、削除するための機能を実装
struct ItemsView: View {
    // グループは、アイテムのリストのコンテナ。 すべてのアイテムの代わりにグループを直接使用すると、UIで更新できるリストの順序を維持できる。
    // @ObservedRealmObjectプロパティ: これによりItemsViewは、変更が発生した場所に関係なく、オブジェクトが変更されたことを「知る」ことができる。
    @ObservedRealmObject var group: Group
    
    /// 左上に表示されるボタン
    var leadingBarButton: AnyView?
    
    var body: some View {
        NavigationView {
            VStack {
                // Realmデータをリスト表示
                List {
                    ForEach(group.items) { item in
                        ItemRow(item: item)
                    }
                    .onDelete(perform: $group.items.remove)
                    .onMove(perform: $group.items.move)
                }
                .listStyle(GroupedListStyle())
                .navigationBarTitle("Items", displayMode: .large)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(
                    leading: self.leadingBarButton,
                    // 右側の編集ボタンを使用して、アイテムの再配置を有効にする
                    trailing: EditButton())
                
                // 右下に配置した追加ボタン
                HStack {
                    Spacer()
                    Button(action: {
                        // 書き込みトランザクションを明示的に開かなくても、remove / move / appendなどのメソッドを使用できる。`@ObservedRealmObject`プロパティラッパーは、必要に応じて書き込みトランザクションを自動的に開く。
                        $group.items.append(Item())
                    }) { Image(systemName: "plus") }
                }.padding()
            }
        }
    }
}

