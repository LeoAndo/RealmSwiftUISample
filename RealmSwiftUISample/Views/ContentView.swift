//
//  ContentView.swift
//  RealmSwiftUISample
//
//  Created by LeoAndo on 2022/05/10.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    // @ObservedResults: ビューが表示されたときにデフォルトのRealmを暗黙的に使用してすべての`Group`をロードする
    @ObservedResults(Group.self) var groups
    
    var body: some View {
        if let group = groups.first {
            // @ObservedResultsプロパティラッパーのおかげで、
            // ビューは`Group`を監視するため、最初の`Group`を追加するとすぐにビューが更新され、ItemsViewが表示される
            ItemsView(group: group)
        } else {
            // Realmにまだグループがない場合、ContentViewは、`Group`を追加している間、ProgressViewを表示する
            ProgressView().onAppear {
                $groups.append(Group())
            }
        }
    }
}
