//
//  BrowseViewController.swift
//  Razorpay-Swift-Example
//
//  Created by Sachin Nautiyal on 08/07/20.
//  Copyright © 2020 Razorpay. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
    
    let buyButton = BuyButton(enabled: true, title: "Buy")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        #if canImport(CryptoKit)
        if #available(iOS 13.0, *) {
            self.view.backgroundColor = .systemBackground
        }
        #endif
        self.setupUI()
    }
    
    func setupLogo() {
        let image = #imageLiteral(resourceName: "Logo")
        navigationItem.titleView = UIImageView(image: image)
    }
    
    func setupUI() {
        self.setupLogo()
        self.setupTopView()
        self.setupDetailView()
    }
    
    func setupTopView() {
        let topView = UIView()
        topView.backgroundColor = UIColor(red: 0.953, green: 0.973, blue: 0.996, alpha: 1)
        self.view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalToConstant: 52),
            topView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Integrate Razorpay with your business."
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let containerView = UIStackView(arrangedSubviews: [descriptionLabel].compactMap({ $0 }))
        containerView.axis = .vertical
        containerView.layoutMargins = UIEdgeInsets(top: 16, left: 20, bottom: 20, right: 16)
        containerView.frame = CGRect(x: 0, y: 0, width: 0, height: containerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.isLayoutMarginsRelativeArrangement = true
        topView.addSubview(containerView)
    }
    
    func setupDetailView() {
        // t-shirt View
        let contentView =  UIView()
        contentView.layer.backgroundColor = UIColor(red: 0.086, green: 0.184, blue: 0.337, alpha: 0.1).cgColor
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let newConstraint = NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([newConstraint])
        let tshirtImageView = UIImageView()
        tshirtImageView.image = #imageLiteral(resourceName: "tShirt")
        contentView.addSubview(tshirtImageView)
        tshirtImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tshirtImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            tshirtImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 12),
            tshirtImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            tshirtImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
        
        // Price and Detailed View
        
        
    }
}

extension UIColor {
    
    static func getRazorpayColor() -> UIColor {
        let color = UIColor(red: 0.169, green: 0.267, blue: 0.525, alpha: 1)
        return color
    }
}
