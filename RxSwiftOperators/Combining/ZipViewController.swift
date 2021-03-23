//
//  ZipViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/24.
//

import UIKit
import RxSwift

class ZipViewController: UIViewController {
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
        let one = Observable<Int>.of(1, 2, 3, 4, 5, 6)
        let two = Observable<String>.of("A", "B", "C", "D")
        
        Observable.zip(one, two)
            .subscribe(onNext: {
                self.text = self.text + "one: \($0), two: \($1)\n"
                self.textView.text = self.text
            }).disposed(by: disposeBag)
    }
}
