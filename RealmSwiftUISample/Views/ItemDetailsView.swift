//
//  ItemDetailsView.swift
//  RealmSwiftUISample
//
//  Created by LeoAndo on 2022/05/11.
//

import SwiftUI
import RealmSwift

/// 編集可能なアイテム詳細View
struct ItemDetailsView: View {
    @ObservedRealmObject var item: Item
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Enter a new name:")
            TextField("New name", text: $item.name)
                .navigationBarTitle(item.name)
                .navigationBarItems(trailing: Toggle(isOn: $item.isFavorite) {
                    Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                })
        }.padding()
    }
}

struct ItemDetailsView_Previews: PreviewProvider {
    static let previewTargetDevice:PreviewDevice = PreviewDevice(rawValue: "iPhone 12 mini")
    static var previews: some View {
        ItemDetailsView(item: Item())
            .previewDevice(previewTargetDevice)
    }
}
