//
//  HistoryRepository.swift
//  Chimere
//
//  Created by Damien Rojo on 29.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

protocol HistoryRepositoryType: class {
    func findOrders(order: [String: String] ,callback: @escaping (UserOrdersResponse) -> Void)
}

final class HistoryRepository: HistoryRepositoryType {
    
    let client: HTTPClient
    
    private let token = RequestCancellationToken()
    
    init(client: HTTPClient) {
        self.client = client
    }

    func findOrders(order: [String: String] ,callback: @escaping (UserOrdersResponse) -> Void) {
        let stringURL = "https://chimere.io/api/order/find-orders"
        guard let url = URL(string: stringURL) else { return }

        client.upload(type: UserOrdersResponse.self,
                      requestType: .POST,
                      dictionary: order,
                      url: url,
                      cancelledBy: token) { (orders) in
                        callback(orders)
        }
    }
}
