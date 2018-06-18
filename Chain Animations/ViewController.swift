//
//  ViewController.swift
//  Chain Animations
//
//  Created by Nerimene  on 18/06/2018.
//  Copyright © 2018 Nerimene . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    
    fileprivate func SetupLabels()
    {
        titleLabel.numberOfLines = 0
        bodyLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Helvetica", size: 34)
        titleLabel.text = "Leave us a message"
        bodyLabel.text = "Don't forget to give us feedback on what you'd like to see in the future! \n\n Contact: \n nerimene.brahim@gmail.com"
    }
    
    fileprivate func SetupStackView()
    {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupLabels()
        SetupStackView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimations)))
    }
    
    @objc fileprivate func handleTapAnimations()
    {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
    }
}

