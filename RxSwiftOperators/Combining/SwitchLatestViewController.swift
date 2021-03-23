//
//  SwitchLatestViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/24.
//

import UIKit
import RxSwift

class SwitchLatestViewController: UIViewController {
    private var textView = UITextView()
    private var disposeBag = DisposeBag()
    
    private var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        textView.frame = view.frame
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 32.0)
        
        bind()
    }
    
    private func bind() {
        let first = Observable.from([1, 2, 3, 4, 5])
        let second = Observable.from([10, 20, 30, 40, 50])
        let third = Observable.from([100, 200, 300, 400, 500])
        
        Observable.from([first, second, third])
            .switchLatest()
            .subscribe(onNext: {
                self.text = self.text + "\($0)\n"
                self.textView.text = self.text
            }).disposed(by: disposeBag)
    }
}

