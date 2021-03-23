//
//  AmbViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/24.
//

import UIKit
import RxSwift

class AmbViewController: UIViewController {
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
        let first = PublishSubject<Int>()
        let second = PublishSubject<Int>()
        
        first.amb(second)
            .subscribe(onNext: {
                self.text = self.text + "\($0)\n"
                self.textView.text = self.text
            }).disposed(by: disposeBag)
        
        first.onNext(1)
        second.onNext(2)
        first.onNext(1)
        second.onNext(2)
        first.onNext(1)
        second.onNext(2)
        first.onNext(1)
    }
}
