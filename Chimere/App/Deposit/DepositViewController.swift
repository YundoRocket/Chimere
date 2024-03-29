//
//  DepositViewController.swift
//  antex
//
//  Created by Damien Rojo on 15.04.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import UIKit

final class DepositViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let helper = Helper()
    
    // MARK: - Properties
    
    var viewModel: DepositViewModel!

    // MARK: - Outlets
    
    @IBOutlet weak private var transactionIDView: UIView! {
        didSet {
            transactionIDView.layer.borderWidth = 1
            transactionIDView.layer.borderColor = #colorLiteral(red: 0.9490196078, green: 0.862745098, blue: 0.6078431373, alpha: 1)
            transactionIDView.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet weak private var transactionIDLabel: UILabel!
    
    @IBOutlet weak private var transactionIDValueLabel: UILabel!
    
    @IBOutlet weak private var copyTansactionIDButton: UIButton!
    
    @IBOutlet weak private var descriptionLabel: UITextView!
    
    @IBOutlet weak private var depositWalletView: UIView! {
        didSet {
            depositWalletView.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet weak private var sendLabel: UILabel!
    
    @IBOutlet weak private  var depositAmountLabel: UILabel!
    
    @IBOutlet weak private var copyDepositAmountButton: UIButton!
    
    @IBOutlet weak private var toThisWalletLabel: UILabel!
    
    @IBOutlet weak private var depositQRCodeImageView: UIImageView!
    
    @IBOutlet weak private var addressLabel: UILabel!
    
    @IBOutlet weak private var depositAddressLabel: UILabel!
    
    @IBOutlet weak private var copyDepositAdressButton: UIButton!
    
    @IBOutlet weak private var messageLabel: UILabel! {
       didSet {
           messageLabel.isHidden = true
        }
    }
    
    @IBOutlet weak private var messageValueLabel: UILabel! {
        didSet {
            messageValueLabel.isHidden = true
        }
    }
    
    @IBOutlet weak private var copyMessageValueButton: UIButton! {
       didSet {
           copyMessageValueButton.isHidden = true
       }
    }
    
    @IBOutlet weak var completedButton: UIButton! {
        didSet {
            completedButton.layer.cornerRadius = 10
            completedButton.layer.borderWidth = 1
            completedButton.layer.borderColor = #colorLiteral(red: 0.9490196078, green: 0.862745098, blue: 0.6078431373, alpha: 1)
        }
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        viewModel.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }

    // MARK: - Helpers
    
    private func bind(to viewModel: DepositViewModel) {
        viewModel.transactionIDText = { [weak self] text in
            DispatchQueue.main.async {
                self?.transactionIDLabel.text = text
            }
        }
        
        viewModel.transactionIDValueText = { [weak self] text in
            DispatchQueue.main.async {
                self?.transactionIDValueLabel.text = text
            }
        }
        
        viewModel.copyTansactionIDImageText = { [weak self] text in
            DispatchQueue.main.async {
                self?.copyTansactionIDButton.setBackgroundImage(UIImage(systemName: text), for: .normal)
            }
        }
        
        viewModel.descriptionText = { [weak self] text in
            DispatchQueue.main.async {
                self?.descriptionLabel.text = text
            }
        }
        
        viewModel.sendText = { [weak self] text in
            DispatchQueue.main.async {
                self?.sendLabel.text = text
            }
        }
        
        viewModel.depositAmountText = { [weak self] text in
            DispatchQueue.main.async {
                self?.depositAmountLabel.text = text
            }
        }
        
        viewModel.copyDepositAmountImageText = { [weak self] text in
            DispatchQueue.main.async {
                self?.copyDepositAmountButton.setBackgroundImage(UIImage(systemName: text), for: .normal)
            }
        }
        
        viewModel.toThisWalletText = { [weak self] text in
            DispatchQueue.main.async {
                self?.toThisWalletLabel.text = text
            }
        }
        
        viewModel.depositQRCodeText = { [weak self] text in
            DispatchQueue.main.async {
                guard let image = self?.helper.generateQRCode(from: text) else { return }
                self?.depositQRCodeImageView.image = image
            }
        }
        
        viewModel.addressText = { [weak self] text in
            DispatchQueue.main.async {
                self?.addressLabel.text = text
            }
        }
        
        viewModel.depositAddressText = { [weak self] text in
            DispatchQueue.main.async {
                self?.depositAddressLabel.text = text
            }
        }
        
        viewModel.copyDepositAdressImageText = { [weak self] text in
            DispatchQueue.main.async {
                self?.copyDepositAdressButton.setBackgroundImage(UIImage(systemName: text), for: .normal)
            }
        }
        
        viewModel.messageText = { [weak self] text in
            DispatchQueue.main.async {
                self?.messageLabel.text = text
            }
        }
        
        viewModel.messageValueText = { [weak self] text in
            DispatchQueue.main.async {
                self?.messageValueLabel.text = text
            }
        }
        
        viewModel.copyMessageValueImageText = { [weak self] text in
            DispatchQueue.main.async {
                self?.copyMessageValueButton.setBackgroundImage(UIImage(systemName: text), for: .normal)
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func didPressCopyTransactionIDButton(_ sender: UIButton) {
        helper.copyNotified(button: sender, label: transactionIDValueLabel, bool: false)
    }
    
    @IBAction private func didPressCopyDepositAmountButton(_ sender: UIButton) {
        helper.copyNotified(button: sender, label: depositAmountLabel, bool: true)
    }
    
    @IBAction private func didPressCopyDepositAdressButton(_ sender: UIButton) {
        helper.copyNotified(button: sender, label: depositAddressLabel, bool: false)
    }
    
    @IBAction private func didPressCopyMessageValueButton(_ sender: UIButton) {
        helper.copyNotified(button: sender, label: messageValueLabel, bool: false)
    }
    
    @IBAction func didPressCompletedButton(_ sender: UIButton) {
        viewModel.didPressCompleted()
    }
}
