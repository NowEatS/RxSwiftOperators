//
//  WithLatestFromViewController.swift
//  RxSwiftOperators
//
//  Created by 서태원 on 2021/03/23.
//

import UIKit
import RxSwift

class WithLatestFromViewController: UIViewController {
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
        let first = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
        let second = Observable<Int>.interval(.seconds(3), scheduler: MainScheduler.instance)
        
        first.withLatestFrom(second, resultSelector: {
            self.text = self.text + "first: \($0), second: \($1)\n"
        }).subscribe(onNext: {
            self.textView.text = self.text
        }).disposed(by: disposeBag)
    }
}
