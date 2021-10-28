//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {
    var juiceMaker = JuiceMaker()

    @IBOutlet var stockOfStrawberry: UILabel!
    @IBOutlet var stockOfBanana: UILabel!
    @IBOutlet var stockOfPineapple: UILabel!
    @IBOutlet var stockOfKiwi: UILabel!
    @IBOutlet var stockOfMango: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStockLabel()
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        let juice = switchMenuToUIButton(button: sender)
        try? juiceMaker.make(juice)
        changeStockLabel()
    }
    
    func switchMenuToUIButton(button: UIButton) -> Menu {
        switch button.currentTitle {
        case "딸바쥬스 주문":
            return Menu.strawberryBananaJuice
        case "망키쥬스 주문":
            return Menu.mangoKiwiJuice
        case "딸기쥬스 주문":
            return Menu.strawberryJuice
        case "바나나쥬스 주문":
            return Menu.bananaJuice
        case "파인애플쥬스 주문":
            return Menu.pineappleJuice
        case "키위쥬스 주문":
            return Menu.kiwiJuice
        case "망고쥬스 주문":
            return Menu.mangoJuice
        default:
            fatalError("Non-Existent Button")
        }
    }
    
    func changeStockLabel() {
        let currentStock = juiceMaker.checkFruitStock()
        for (fruit, stock) in currentStock {
            switch fruit {
            case .strawberry:
                stockOfStrawberry.text = stock
            case .banana:
                stockOfBanana.text = stock
            case .pineapple:
                stockOfPineapple.text = stock
            case .kiwi:
                stockOfKiwi.text = stock
            case .mango:
                stockOfMango.text = stock
            }
        }
    }
}
