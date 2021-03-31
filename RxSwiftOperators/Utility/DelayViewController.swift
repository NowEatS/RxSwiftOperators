//
//  DelayViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/31.
//

import UIKit
import RxSwift

class DelayViewController: UIViewController {
    
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
        let delayObservable = Observable.of(1, 2, 3, 4, 5)
        
        delayObservable.delay(.seconds(3), scheduler: MainScheduler.instance)
            .subscribe(onNext: {
                print($0)
            }).disposed(by: disposeBag)
    }
}
