//
//  KMOOC_TCAApp.swift
//  KMOOC_TCA
//
//  Created by Nam Hoon Jeong on 5/29/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct KMOOC_TCAApp: App {
    var body: some Scene {
        WindowGroup {
            KmoocListView(store: Store(initialState: KmoocStore.State(), reducer: {
                KmoocStore()
            }))
        }
    }
}
