//
//  TakeUntilViewController.swift
//  RxSwiftOperators
//
//  Created by 서태원 on 2021/03/23.
//

import UIKit
import RxSwift

class TakeUntilViewController: UIViewController {
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
        let observable = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
        
        observable.take(until: Observable<Int>.interval(.seconds(5), scheduler: MainScheduler.instance))
            .subscribe(onNext: {
                self.text = self.text + "\($0)\n"
                self.textView.text = self.text
            }).disposed(by: disposeBag)
    }
}
