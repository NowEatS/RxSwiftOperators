//
//  StartWithViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/24.
//

import UIKit
import RxSwift

class StartWithViewController: UIViewController {
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
        let first = Observable.of(1, 2, 3, 4, 5)
        
        first.startWith(0)
            .subscribe(onNext: {
                self.text = self.text + "\($0)\n"
                self.textView.text = self.text
            }).disposed(by: disposeBag)
    }
}
