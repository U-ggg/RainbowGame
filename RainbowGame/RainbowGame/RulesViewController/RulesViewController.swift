//
//  RulesViewController.swift
//  RainbowGame
//
//  Created by sidzhe on 12.11.2023.
//

import UIKit

 class RulesViewController: UIViewController {
    
     private let backgoundView: UIView = {
         let view = UIView()
         view.backgroundColor = .red
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()
     
     private let labelRules: UILabel = {
         let label = UILabel()
         label.numberOfLines = 0
         label.textAlignment = .center
         label.textColor = .red
         //label.textColor = UIColor(red: 190, green: 46, blue: 106, alpha: 1)
         label.font = .systemFont(ofSize: 24, weight: .regular)
         label.text = "ПРАВИЛА ИГРЫ"
         return label
     }()
     
     private let labelText1: UILabel = {
         let text = "На экране в случайном месте появляется слово, обозначающее цвет, например: написано «синий»:"
         let attributedString = NSMutableAttributedString(string: text)
         attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location: 84, length: 7))
         let label = UILabel()
         label.numberOfLines = 0
         label.textAlignment = .left
         label.textColor = .black
         label.font = .systemFont(ofSize: 20, weight: .regular)
         label.attributedText = attributedString
         return label
     }()
     
     private let labelText2: UILabel = {
         let text = """
Нужно произнести вслух цвет слова (если опция «подложка для букв» выключена) или цвет фона, на котором написано слово (если опция «подложка для букв» включена):
говорим «зеленый».

         В игре можно изменять скорость от 1x до 5x. А так же длительность игры.
"""
         let attributedString = NSMutableAttributedString(string: text)
         attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location: 161, length: 17))
         let label = UILabel()
         label.numberOfLines = 0
         label.textAlignment = .left
         label.textColor = .black
         label.font = .systemFont(ofSize: 20, weight: .regular)
         label.attributedText = attributedString
         return label
     }()
     
     private let labelUnderlayOff: UILabel = {
         let label = UILabel()
         label.numberOfLines = 0
         label.textAlignment = .center
         label.textColor = .black
         label.font = .systemFont(ofSize: 10, weight: .regular)
         label.text = "подложка выключена:"
         return label
     }()
     
     private let labelUnderlayOn: UILabel = {
         let label = UILabel()
         label.numberOfLines = 0
         label.textAlignment = .center
         label.textColor = .black
         label.font = .systemFont(ofSize: 10, weight: .regular)
         label.text = "подложка включена:"
         return label
     }()
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
     
//     override func viewDidLayoutSubviews() {
//         super.viewDidLayoutSubviews()
//
////         labelRules.frame = CGRect(x: 75, y: 176, width: 225, height: 21)
////         labelText1.frame = CGRect(x: 66, y: 197, width: 263, height: 143)
////         labelText2.frame = CGRect(x: 66, y: 446, width: 258, height: 303)
////         labelUnderlayOff.frame = CGRect(x: 52, y: 350, width: 118, height: 20)
////         labelUnderlayOn.frame = CGRect(x: 197, y: 350, width: 118, height: 20)
//     }
     
     func setupUI() {
        
         view.backgroundColor = .white
         title = "Помощь"
         view.addSubview(backgoundView)
         NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            view.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 63)
         ])
//         view.addSubview(labelRules)
//         view.addSubview(labelText1)
//         view.addSubview(labelText2)
//         view.addSubview(labelUnderlayOff)
//         view.addSubview(labelUnderlayOn)
         
     }
    
    @objc private func viewRules() {
        let vc = RulesViewController()
        //vc.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
