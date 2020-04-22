//
//  HomeViewModel.swift
//  antex
//
//  Created by Damien Rojo on 14.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class ExchangeViewModel {
    
    // MARK: - Properties

    private weak var delegate: ExchangeViewControllerDelegate?
    
    private let repository: ExchangeRepositoryType

    init(delegate: ExchangeViewControllerDelegate?, repository: ExchangeRepositoryType) {
        self.delegate = delegate
        self.repository = repository
    }

    // MARK: - Outputs

    var descriptionText: ((String) -> Void)?
    
    // deposit

    var depositText: ((String) -> Void)?
    
    var depositAmountText: ((String) -> Void)?
    
    var depositCurrencyNameText: ((String) -> Void)?
    
    var depositCurrencySymbolText: ((String) -> Void)?
    
    var refundAddressText: ((String) -> Void)?
    
    // info
    
    var exchangeRatesText: ((String) -> Void)?

    // destination

    var destinationText: ((String) -> Void)?

    var destinationAmountText: ((String) -> Void)?

    var destinationCurrencyNameText: ((String) -> Void)?

    var destinationCurrencySymbolText: ((String) -> Void)?

    var destinationAddressText: ((String) -> Void)?
        
    // next step

    var exchangeNowText: ((String) -> Void)?

    // MARK: - Inputs
    
    func viewDidLoad() {
        descriptionText?("We are making crypto easy to exchange")
        
        depositText?("You send")
        depositAmountText?("0.01")
        depositCurrencyNameText?("Ethereum")
        depositCurrencySymbolText?("ETH")
        refundAddressText?("Enter BTC refund address here... 👈")
        
        exchangeRatesText?("1 BTC ~ 42.907 ETH")
        
        destinationText?("You get approximately")
        destinationAmountText?("0.01")
        destinationCurrencyNameText?("Bitcoin")
        destinationCurrencySymbolText?("BTC")
        destinationAddressText?("Destination ETH address here... 👈")
        
        exchangeNowText?("Exchange now")
    }
    
    func didPressChangeDepositCurrency() {
        delegate?.didShowCurrencieslist()
    }
    
    func didPressSwitch() {
        
    }
    
    func didPressChangeDestinationCurrency() {
        delegate?.didShowCurrencieslist()
    }
    
    func didPressExchangeNow(depositCurrencySymbolText: String, refundAddressText: String, destinationCurrencySymbolText: String, destinationAddressText: String) {
    
//        let orderItems: [String: Any] = ["deposit_amount": "120", "deposit_ticker": depositCurrencySymbolText, "refund_address": "0xa2fec727757e47c64942e23949da839e6da948ac", "destination_amount": "34", "destination_ticker": destinationCurrencySymbolText, "destination_address": "18cBEMRxXHqzWWCxZNtU91F5sbUNKhL5PX"]
//        repository.postOrder(order: orderItems) { (depositeResponse) in
//            
//        }

//        guard !refundAddressText.isEmpty else {
//            presentAlert(message: "You must fill refund address")
//            return
//        }
//
//        guard !destinationAddressText.isEmpty else {
//            presentAlert(message: "You must fill destination address")
//            return
//        }

//        repository.getAddressValidation(for: refundAddressText, symbol: depositCurrencySymbolText) { (validationDepositAdress) in
//            self.repository.getAddressValidation(for: destinationAddressText, symbol: destinationCurrencySymbolText) { (valisationDestinationAdress) in
//                self.addressValidation(validationDepositAdress: validationDepositAdress, valisationDestinationAdress: valisationDestinationAdress)
//            }
//        }
    }
    
    private func presentAlert(message: String) {
        DispatchQueue.main.async {
            self.delegate?.didPresentAlert(for: .badEntry(alertConfiguration: AlertConfiguration(title: "Warning", message: message, okMessage: "ok", cancelMessage: nil)))
        }
    }
    
    private func addressValidation(validationDepositAdress: Bool, valisationDestinationAdress: Bool) {
        if validationDepositAdress == false || valisationDestinationAdress == false {
            self.presentAlert(message: "Your refund address or your destination does not exist")
            return
        } else {
            DispatchQueue.main.async {
//                self.delegate?.didSelectExchangeNow(deposit: Deposit)
            }
        }
    }
}
