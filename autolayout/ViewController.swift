//
//  ViewController.swift
//  autolayout
//
//  Created by Nanashi on 2018/06/09.
//  Copyright © 2018年 example.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var _buttons: [UIButton] = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ボタン生成
        createButons()
        // 成約追加
        setConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ボタン生成
    func createButons() {
        for i in 0..<5 {
            let button = UIButton()
            button.setTitle("Button \(i + 1)", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .blue
            self.view.addSubview(button)
            _buttons.append(button)
        }
    }

    // 成約追加
    func setConstraints() {
        var viewConstraints: [NSLayoutConstraint] = [NSLayoutConstraint]()
        for (i, button) in _buttons.enumerated() {
            button.translatesAutoresizingMaskIntoConstraints = false
            if i > 0 {
                viewConstraints.append(NSLayoutConstraint(item: button, .top, toItem: _buttons[i - 1], .bottom))
            } else {
                viewConstraints.append(NSLayoutConstraint(item: button, .top, toItem: self.view,       .top))
            }
            viewConstraints.append(NSLayoutConstraint(item: button, .leading,  toItem: self.view, .leading,  constant: 1.0))
            viewConstraints.append(NSLayoutConstraint(item: button, .trailing, toItem: self.view, .trailing, constant: -1.0))
            viewConstraints.append(NSLayoutConstraint(item: button, .height,   toItem: self.view, .height, multiplier: 0.25))
        }
        self.view.addConstraints(viewConstraints)
    }
}

//
// NSLayoutConstraint
//
// - parameter item:        制約を追加するオブジェクト
// - parameter attr:        制約を追加するオブジェクトに与える属性
// - parameter toItem:      制約の基準となるオブジェクト
// - parameter toAttr:      制約の基準となるオブジェクトに使用する属性
// - parameter relatedBy:   計算式の関係性
// - parameter multiplier:  乗数値
// - parameter constant:    定数値
// - parameter priority:    制約の優先度
//
extension NSLayoutConstraint {
    convenience init(item:       Any,
                     _ attr:     NSLayoutAttribute,
                     toItem:     Any?,
                     _ toAttr:   NSLayoutAttribute,
                     relatedBy:  NSLayoutRelation = .equal,
                     multiplier: CGFloat          = 1.0,
                     constant:   CGFloat          = 0.0,
                     priority:   UILayoutPriority = .required) {
        self.init(
            item:       item,
            attribute:  attr,
            relatedBy:  relatedBy,
            toItem:     toItem,
            attribute:  toAttr,
            multiplier: multiplier,
            constant:   constant
        )
        self.priority = priority
        self.isActive = true
    }
}

