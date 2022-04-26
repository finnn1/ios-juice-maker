//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblStrawberryStock: UILabel!
    @IBOutlet weak var lblBananaStock: UILabel!
    @IBOutlet weak var lblPineappleStock: UILabel!
    @IBOutlet weak var lblKiwiStock: UILabel!
    @IBOutlet weak var lblMangoStock: UILabel!
    @IBOutlet weak var btnStrawberryBananaOrder: UIButton!
    @IBOutlet weak var btnMangoKiwiOrder: UIButton!
    @IBOutlet weak var btnStrawberryOrder: UIButton!
    @IBOutlet weak var btnBananaOrder: UIButton!
    @IBOutlet weak var btnPineappleOrder: UIButton!
    @IBOutlet weak var btnKiwiOrder: UIButton!
    @IBOutlet weak var btnMangoOrder: UIButton!
    
    var order: JuiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showStock()
    }

    func showStock() {
        lblStrawberryStock.text = order.fruitStore.convertToString(fruit: .strawberry)
        lblBananaStock.text = order.fruitStore.convertToString(fruit: .banana)
        lblPineappleStock.text = order.fruitStore.convertToString(fruit: .pineapple)
        lblKiwiStock.text = order.fruitStore.convertToString(fruit: .kiwi)
        lblMangoStock.text = order.fruitStore.convertToString(fruit: .mango)
    }
    
    @IBAction func orderJuice(sender: UIButton) {
        var juiceMenu: Menu = .mangoJuice
        switch sender {
        case btnStrawberryBananaOrder:
            juiceMenu = .strawberryBananaJuice
        case btnMangoKiwiOrder:
            juiceMenu = .mangoKiwiJuice
        case btnStrawberryOrder:
            juiceMenu = .strawberryJuice
        case btnBananaOrder:
            juiceMenu = .bananaJuice
        case btnPineappleOrder:
            juiceMenu = .pineappleJuice
        case btnKiwiOrder:
            juiceMenu = .kiwiJuice
        case btnMangoOrder:
            juiceMenu = .mangoJuice
        default:
            break
        }
        
        do{
            try order.makeJuice(what: juiceMenu)
        } catch {
            print("재고가 부족합니다.")
        }
        
        showStock()
    }
    
}

