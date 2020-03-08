
//
//  ProgrammaticViewController.swift
//  Demo
//
//  Created by Ram on 06/03/20.
//  Copyright © 2020 Kevin Hirsch. All rights reserved.
//

import Foundation
import UIKit
import DropDown
class ProgrammaticViewController: UIViewController {
    let chooseArticleButton = UIButton(frame: .zero)
    let articleDropDown = DropDown(frame: .zero)
    
    let chooseTopicButton = UIButton(frame: .zero)
    let topicDropDown = DropDown(frame: .zero)
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.addSubviews()
        self.setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func addSubviews() {
        self.view.accessibilityIdentifier = "ProgrammaticViewController"
        self.chooseArticleButton.accessibilityIdentifier = "chooseArticleButton"
        self.view.addSubview(self.chooseArticleButton)
        self.chooseTopicButton.accessibilityIdentifier = "chooseTopicButton"
        self.view.addSubview(self.chooseTopicButton)
    }
    
    func setupSubviews() {
        setupChooseArticleButton()
        setupArticleDropDown()
        setupChooseTopicButton()
        setupTopicDropDown()
    }
    @objc func showArticleDropDown() {
        self.articleDropDown.show()
    }
    @objc func showTopicDropDown() {
        self.topicDropDown.show()
    }
    func setupChooseArticleButton() {
        self.chooseArticleButton.addTarget(self, action: #selector(showArticleDropDown), for: .touchUpInside)
        self.chooseArticleButton.backgroundColor = .darkGray
        self.chooseArticleButton.setTitle("Choose article", for: .normal)
        self.chooseArticleButton.translatesAutoresizingMaskIntoConstraints  = false
        NSLayoutConstraint.activate([
            self.chooseArticleButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.chooseArticleButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100.0),
            self.chooseArticleButton.widthAnchor.constraint(equalToConstant: 250.0),
            self.chooseArticleButton.heightAnchor.constraint(equalToConstant: 33.0)
        ])
    }
    
    func setupChooseTopicButton() {
        self.chooseTopicButton.addTarget(self, action: #selector(showTopicDropDown), for: .touchUpInside)
        self.chooseTopicButton.backgroundColor = .darkGray
        self.chooseTopicButton.setTitle("Choose topic", for: .normal)
        self.chooseTopicButton.translatesAutoresizingMaskIntoConstraints  = false
        NSLayoutConstraint.activate([
            self.chooseTopicButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.chooseTopicButton.topAnchor.constraint(equalTo: self.chooseArticleButton.bottomAnchor, constant: 200.0),
            self.chooseTopicButton.widthAnchor.constraint(equalToConstant: 250.0),
            self.chooseTopicButton.heightAnchor.constraint(equalToConstant: 33.0)
        ])
    }
    
    func setupArticleDropDown() {
        self.articleDropDown.width = 300.0
        // self.dropDown.dropDownHeight = 200.0
        self.articleDropDown.anchorView = self.chooseArticleButton
        self.articleDropDown.bottomOffset = CGPoint(x: 0, y: 39.0)
        let array = [
            "iPhone SE | Black | 64G",
            "Samsung S7",
            "Huawei P8 Lite Smartphone 4G",
            "Asus Zenfone Max 4G",
            "Apple Watch | Sport Edition"
        ]
        self.articleDropDown.dataSource = array
        self.articleDropDown.selectionBackgroundColor = .black
        self.articleDropDown.selectedTextColor = .white
        self.articleDropDown.backgroundColor = .white
        self.articleDropDown.textColor = .black
        self.articleDropDown.dimmedBackgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.articleDropDown.cornerRadius = 5.0
        self.articleDropDown.cancelAction = {
            print("articleDropDown - cancel was called")
        }
        self.articleDropDown.willShowAction = {
            print("articleDropDown - will be shown")
        }
        self.articleDropDown.selectionAction = { (index, value) -> Void in
            print("articleDropDown - selectionAction - index: \(index) - value: \(value)")
            self.chooseArticleButton.setTitle(array[index], for: .normal)
        }
        
    }
    func setupTopicDropDown() {
        self.topicDropDown.width = 300.0
        // self.dropDown.dropDownHeight = 200.0
        self.topicDropDown.anchorView = self.chooseTopicButton
        self.topicDropDown.bottomOffset = CGPoint(x: 0, y: 39.0)
        let array = [
            "Addition",
            "Subtraction",
            "Multiplication",
            "Division",
            "Placevalue"
        ]
        let disabled = ["Addition", "Division"]
        self.topicDropDown.dataSource = array
        self.topicDropDown.cellClass = MyProgrammaticCell.self
        self.topicDropDown.selectionBackgroundColor = .black
        self.topicDropDown.selectedTextColor = UIColor.white
        
        self.topicDropDown.backgroundColor = .white
        self.topicDropDown.textColor = UIColor.black
        
        
        self.topicDropDown.dimmedBackgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.topicDropDown.cornerRadius = 5.0
        self.topicDropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? MyProgrammaticCell else { return }
            
            if disabled.contains(item) {
                print("topicDropDown - customCellConfiguration - index: \(index) - item: \(item) - disabled item")
                cell.normalTextColor = .lightGray
            }
        }
        
        
        
        self.topicDropDown.cancelAction = {
            print("topicDropDown - cancel was called")
        }
        self.topicDropDown.willShowAction = {
            print("topicDropDown - will be shown")
        }
        
        self.topicDropDown.selectionAction = { (index, value) -> Void in
            print("topicDropDown - selectionAction - index: \(index) - value: \(value)")
            self.chooseTopicButton.setTitle(array[index], for: .normal)
        }
        
        self.topicDropDown.allowSelection = { (index, value) -> Bool in
            print("topicDropDown - allowSelection - index: \(index)")
            if disabled.contains(value) {
                return false
            } else {
                return true
            }
        }
        
        
    }
}
