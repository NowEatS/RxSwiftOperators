//
//  ViewController.swift
//  RxSwiftOperators
//
//  Created by TaeWon Seo on 2021/03/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableViee: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Operators"
    }
    
    // MARK: - TableView DataSource & Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = Sections.allCases[section]
        switch section {
        case .Filtering:
            return Filtering.allCases.count
        
        case .Combining:
            return Combining.allCases.count
            
        case .Utility:
            return Utility.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Sections.allCases[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = Sections.allCases[indexPath.section]
        var itemName: String = ""
        switch section {
        case .Filtering:
            itemName = Filtering.allCases[indexPath.row].rawValue
        
        case .Combining:
            itemName = Combining.allCases[indexPath.row].rawValue
            
        case .Utility:
            itemName = Utility.allCases[indexPath.row].rawValue
        }
        
        let cell = UITableViewCell()
        cell.textLabel?.text = itemName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = Sections.allCases[indexPath.section]
        var targetVC = UIViewController()
        switch section {
        case .Filtering:
            let item = Filtering.allCases[indexPath.row]
            switch item {
            case .debounce:
                targetVC = DebounceViewController()
                
            case .throttle:
                targetVC = ThrottleViewController()
                
            case .distinctUntilChanged:
                targetVC = DistinctUntilChangedViewController()
                
            case .elementAt:
                targetVC = ElementAtViewController()
                
            case .filter:
                targetVC = FilterViewController()
                
            case .first:
                targetVC = FirstViewController()
                
            case .ignoreElements:
                targetVC = IgnoreViewController()
                
            case .sample:
                targetVC = SampleViewController()
                
            case .skip:
                targetVC = SkipViewController()
                
            case .skipWhile:
                targetVC = SkipWhileViewController()
                
            case .skipUntil:
                targetVC = SkipUntilViewController()
                
            case .take:
                targetVC = TakeViewController()
                
            case .takeWhile:
                targetVC = TakeWhileViewController()
                
            case .takeUntil:
                targetVC = TakeUntilViewController()
            }
        
        case .Combining:
            let item = Combining.allCases[indexPath.row]
            switch item {
            case .combineLatest:
                targetVC = CombineLatestViewController()
                
            case .withLatestFrom:
                targetVC = WithLatestFromViewController()
                
            case .merge:
                targetVC = MergeViewController()
                
            case .switchLatest:
                targetVC = SwitchLatestViewController()
                
            case .zip:
                targetVC = ZipViewController()
                
            case .concat:
                targetVC = ConcatViewController()
                
            case .amb:
                targetVC = AmbViewController()
                
            case .startWith:
                targetVC = StartWithViewController()
            }
            
        case .Utility:
            let item = Combining.allCases[indexPath.row]
            switch item {
            case .combineLatest:
                targetVC = DoViewController()
                
            default:
                targetVC = UIViewController()
            }
        }
        
        navigationController?.pushViewController(targetVC, animated: true)
    }
    
    
}
