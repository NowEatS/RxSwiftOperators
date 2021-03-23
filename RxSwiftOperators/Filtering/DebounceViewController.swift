//
//  DebounceViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/23.
//

import UIKit
import RxSwift
import RxCocoa

class DebounceViewController: UIViewController {
    
    private var debounceButton = UIButton(type: .system)
    private var debounceLabel = UILabel()
    
    private var debounceCount = 0
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Debounce"
        
        view.addSubview(debounceButton)
        debounceButton.setTitle("Debounce", for: .normal)
        debounceButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([debounceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     debounceButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        view.addSubview(debounceLabel)
        debounceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([debounceLabel.topAnchor.constraint(equalTo: debounceButton.bottomAnchor, constant: 8),
                                     debounceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        debounceLabel.text = "\(debounceCount)"
        
        bind()
    }
    
    private func bind() {
        debounceButton.rx.tap.asDriver()
            .drive(onNext: { _ in
                self.debounceCount += 1
            }).disposed(by: disposeBag)
        
        debounceButton.rx.tap.asDriver()
            .debounce(.seconds(3))
            .drive(onNext: { _ in
                self.debounceLabel.text = "\(self.debounceCount)"
                self.debounceCount = 0
            }).disposed(by: disposeBag)
    }
}
