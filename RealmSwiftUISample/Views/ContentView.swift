//
//  ContentView.swift
//  RealmSwiftUISample
//
//  Created by LeoAndo on 2022/05/10.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    // デフォルトのRealmオブジェクトを暗黙的に使う
    @ObservedResults(Group.self) var groups
    
    var body: some View {
        if let group = groups.first {
            ItemsView(group: group)
        } else {
             // このアプリでは、Realmに1つのグループのみ必要
             // このアプリを拡張して、複数のグループをサポート可能
            ProgressView().onAppear {
                $groups.append(Group())
            }
        }
    }
}
