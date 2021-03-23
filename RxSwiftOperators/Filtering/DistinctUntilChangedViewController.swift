//
//  DistinctUntilChangedViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/23.
//

import UIKit
import RxSwift

class DistinctUntilChangedViewController: UIViewController {
    
    private var textView = UITextView()
    private var disposeBag = DisposeBag()
    
    private var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        textView.frame = view.frame
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 32.0)
        
        Observable.of(1, 2, 2, 2, 3, 1, 1, 5)
            .distinctUntilChanged()
            .subscribe(onNext: {
                self.text = self.text + "\($0)\n"
                self.textView.text = self.text
            }).disposed(by: disposeBag)
    }
}
