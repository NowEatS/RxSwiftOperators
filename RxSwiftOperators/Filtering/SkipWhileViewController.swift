//
//  SkipWhileViewController.swift
//  RxSwiftOperators
//
//  Created by 서태원 on 2021/03/23.
//

import UIKit
import RxSwift

class SkipWhileViewController: UIViewController {
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
        let names = ["성표", "현호", "석준", "진모", "태원", "연주", "재은", "상진", "예빈", "수빈"]
        
        Observable.from(names).skip(while: { $0 != "태원" }  )
            .subscribe(onNext: {
                self.text = self.text + $0 + "\n"
                self.textView.text = self.text
            }).disposed(by: disposeBag)
    }
}
