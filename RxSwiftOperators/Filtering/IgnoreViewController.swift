//
//  IgnoreViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/23.
//

import UIKit
import RxSwift

class IgnoreViewController: UIViewController {
    private var textView = UITextView()
    private var disposeBag = DisposeBag()
    
    private let subject = PublishSubject<Int>()
    
    private var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        textView.frame = view.frame
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 32.0)
        
        subject.ignoreElements()
            .subscribe {
                print($0)
                self.text = self.text + "이벤트 전달됨."
                self.textView.text = self.text
            }.disposed(by: disposeBag)
        
        subject.onNext(1)
        subject.onNext(3)
        subject.onNext(5)
        subject.onNext(2)
        subject.onCompleted()
    }
}
