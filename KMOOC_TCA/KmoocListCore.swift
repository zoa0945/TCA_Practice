//
//  KmoocListCore.swift
//  KMOOC_TCA
//
//  Created by Nam Hoon Jeong on 6/7/24.
//

import SwiftUI
import ComposableArchitecture

struct KmoocStore: Reducer {
    struct State: Equatable {
        var classList: [Items] = []
        var thumbnail: [UIImage] = []
    }
    
    enum Action {
        case fetchData
        case dataResponse([Items])
        case imageResponse(UIImage)
    }
    
    var body: some ReducerOf<Self> {
        let apiKey = "ippi%2Fy9Gf3%2BA4JqB8D4T2JiHyZWq78e%2BSgmpwgpM5dpNadZ4v4qLHOzBm8nMNt8Kv2GST3iGtXWwxk3cqswLPg%3D%3D"
        
        Reduce { state, action in
            switch action {
            case .fetchData:
                return .run { send in
                    guard let url = URL(string: "http://apis.data.go.kr/B552881/kmooc_v2_0/courseList_v2_0?serviceKey=\(apiKey)&Page=2&Size=15") else {
                        print(URLError(.badURL))
                        return
                    }
                    
                    let (data, _) = try await URLSession.shared.data(
                        from: url
                    )
                    
                    let response = try JSONDecoder().decode(KmoocList.self, from: data)
                    
                    for i in 0..<response.list.count {
                        guard let url = URL(string: response.list[i].classImage) else { return }
                        
                        let (data, _) = try await URLSession.shared.data(
                            from: url
                        )
                        
                        guard let image = UIImage(data: data) else { return }
                        await send(.imageResponse(image))
                    }
                    
                    await send(.dataResponse(response.list))
                }
                
            case let .dataResponse(classList):
                state.classList = classList
                return .none
  
            case let .imageResponse(image):
                state.thumbnail.append(image)
                return .none
            }
        }
    }
}
