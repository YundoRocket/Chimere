//
//  CurrenciesTableViewCell.swift
//  antex
//
//  Created by Damien Rojo on 16.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class CurrenciesTableViewCell: UITableViewCell {
    
    // MARK: - Private Properties
    
    private var client: HTTPClient!

    private var token: RequestCancellationToken?
    
    // MARK: - Outlets
    
    @IBOutlet weak private var currencyImageView: UIImageView!
    
    @IBOutlet weak private var currencyNameLabel: UILabel!
    
    @IBOutlet weak private var currencySymbolLabel: UILabel!

    // MARK: - Action
    
    func configure(with currency: Currency) {
        currencyImageView.image = UIImage(named: currency.symbol)
        currencyNameLabel.text = currency.name
        currencySymbolLabel.text = currency.symbol
    }
}