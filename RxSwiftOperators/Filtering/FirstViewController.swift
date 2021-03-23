//
//  FirstViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/23.
//

import UIKit
import RxSwift

class FirstViewController: UIViewController {
    
    private var textView = UITextView()
    private var disposeBag = DisposeBag()
    
    private var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        textView.frame = view.frame
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 32.0)
        
        operate(numbers: [1])
        operate(numbers: [0, 2, 3])
        operate(numbers: [2])
        operate(numbers: [1, 2])
        operate(numbers: [])
    }
    
    private func operate(numbers: [Int]) {
        
        Observable.from(numbers)
            .first()
            .subscribe(onSuccess: {
                self.text = self.text + "\($0)\n"
                self.textView.text = self.text
            }, onFailure: { error in
                print(error.localizedDescription)
            }, onDisposed: {
                print("'First Operator' Disposed")
            }).disposed(by: disposeBag)
    }
}
