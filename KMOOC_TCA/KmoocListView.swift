//
//  KmoocListView.swift
//  KMOOC_TCA
//
//  Created by Nam Hoon Jeong on 6/5/24.
//

import SwiftUI
import ComposableArchitecture

struct KmoocListView: View {
    let store: StoreOf<KmoocStore>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            List {
                VStack {
                    ForEach(0..<viewStore.classList.count, id: \.self) { i in
                        HStack(spacing: 10) {
                            Image(uiImage: viewStore.thumbnail[i])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                            
                            VStack(alignment: .leading) {
                                Text("\(viewStore.classList[i].className)")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                                
                                Spacer()
                                
                                Text("\(viewStore.classList[i].orgName)")
                                    .font(.system(size: 14))
                                    .fontWeight(.regular)
                                    .foregroundStyle(.gray)
                                
                                Text("\(viewStore.classList[i].startDate) ~ \(viewStore.classList[i].endDate)")
                                    .font(.system(size: 14))
                                    .fontWeight(.regular)
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                        }
                    }
                }
            }
            .onAppear {
                viewStore.send(.fetchData)
            }
        }
    }
}
