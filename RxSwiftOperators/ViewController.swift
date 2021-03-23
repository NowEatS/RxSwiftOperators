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
                
            default:
                return
            }
        
        case .Combining:
            return
        }
        
        navigationController?.pushViewController(targetVC, animated: true)
    }
    
    
}
