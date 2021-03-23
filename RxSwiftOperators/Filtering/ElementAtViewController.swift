//
//  ElementAtViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/23.
//

import UIKit
import RxSwift

class ElementAtViewController: UIViewController {

    private var textView = UITextView()
    private var disposeBag = DisposeBag()
    private let observable = Observable.of(1, 2, 3, 4, 5, 6)
    
    private var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        textView.frame = view.frame
        textView.font = .systemFont(ofSize: 32.0)
        
        subscribe(1)
        subscribe(0)
        subscribe(1)
        subscribe(5)
        subscribe(6)
    }
    
    private func subscribe(_ n: Int) {
        observable.element(at: n)
            .subscribe(onNext: {
                self.text = self.text + "\($0)\n"
                self.textView.text = self.text
            }).disposed(by: disposeBag)
    }
}
