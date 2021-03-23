//
//  ThrottleViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/23.
//

import UIKit
import RxSwift
import RxCocoa

class ThrottleViewController: UIViewController {

    private var throttleButton = UIButton(type: .system)
    private var throttleLabel = UILabel()
    
    private var throttleCount = 0
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Throttle"
        
        view.addSubview(throttleButton)
        throttleButton.setTitle("throttle", for: .normal)
        throttleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([throttleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     throttleButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        view.addSubview(throttleLabel)
        throttleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([throttleLabel.topAnchor.constraint(equalTo: throttleButton.bottomAnchor, constant: 8),
                                     throttleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        throttleLabel.text = "\(throttleCount)"
        
        bind()
    }
    
    private func bind() {
        throttleButton.rx.tap.asDriver()
            .throttle(.seconds(3))
            .drive(onNext: { _ in
                self.throttleCount += 1
                self.throttleLabel.text = "\(self.throttleCount)"
            }).disposed(by: disposeBag)
    }
}
