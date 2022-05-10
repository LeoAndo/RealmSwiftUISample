//
//  Item.swift
//  RealmSwiftUISample
//
//  Created by LeoAndo on 2022/05/10.
//

import RealmSwift

/// ランダム値
let randomAdjectives = [
    "fluffy", "classy", "bumpy", "bizarre", "wiggly", "quick", "sudden",
    "acoustic", "smiling", "dispensable", "foreign", "shaky", "purple", "keen",
    "aberrant", "disastrous", "vague", "squealing", "ad hoc", "sweet"
]

/// ランダム値
let randomNouns = [
    "floor", "monitor", "hair tie", "puddle", "hair brush", "bread",
    "cinder block", "glass", "ring", "twister", "coasters", "fridge",
    "toe ring", "bracelet", "cabinet", "nail file", "plate", "lace",
    "cork", "mouse pad"
]
/// 個別のアイテム
final class Item: Object, ObjectKeyIdentifiable {
    /// グループの一意のID。 `primaryKey：true`は、_idメンバーをRealmの主キーとして宣言
    @Persisted(primaryKey: true) var _id: ObjectId
    
    /// アイテムの名前 (デフォルト値はランダムに決める)
    @Persisted var name = "\(randomAdjectives.randomElement()!) \(randomNouns.randomElement()!)"
    
    /// アイテムのお気に入りフラグ
    @Persisted var isFavorite = false
    
    /// このアイテムが含まれている`Group`へのバックリンク
    @Persisted(originProperty: "items") var group: LinkingObjects<Group>
}
