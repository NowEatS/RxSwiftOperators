//
//  DoViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/31.
//

import UIKit
import RxSwift

class DoViewController: UIViewController {

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
        let doObservable = Observable.of(1, 2, 3, 4, 5)
        
        doObservable.do(onNext: {
                $0 * 10 // do 연산자 안에서 수정된 이벤트는 실제로 수정된 값을 전달하지 않고, 원래 값을 전달한다.
            }).subscribe(onNext: {
                self.text = self.text + "\($0)\n"
                self.textView.text = self.text
            }).disposed(by: disposeBag)
    }
}
