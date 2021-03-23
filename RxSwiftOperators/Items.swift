//
//  Items.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/23.
//

import Foundation

enum Sections: String, CaseIterable {
    case Filtering
    case Combining
}

enum Filtering: String, CaseIterable {
    case debounce
    case throttle
    case distinctUntilChanged
    case elementAt
    case filter
    case first
    case ignoreElements
    case sample
    case skip
    case skipWhile
    case skipUntil
    case take
    case takeWhile
    case takeUntil
}

enum Combining: String, CaseIterable {
    case combineLatest
    case withLatestFrom
    case merge
    case switchLatest
    case zip
    case concat
    case amb
    case startWith
}
