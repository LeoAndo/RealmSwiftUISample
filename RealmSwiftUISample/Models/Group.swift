//
//  Group.swift
//  RealmSwiftUISample
//
//  Created by LeoAndo on 2022/05/10.
//

import RealmSwift
//import SwiftUI


/// アイテムのコレクション
final class Group: Object, ObjectKeyIdentifiable {
    /// グループの一意のID。 `primaryKey：true`は、_idメンバーをRealmの主キーとして宣言
    @Persisted(primaryKey: true) var _id: ObjectId

    /// Groupのコレクションアイテム
    @Persisted var items = RealmSwift.List<Item>()
}
