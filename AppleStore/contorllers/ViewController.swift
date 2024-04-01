//
//  ViewController.swift
//  AppleStore
//
//  Created by Seungseop Lee on 4/1/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // 임시 데이터
    var itemArray: [buyItems] = [
        buyItems(buyName: "iPhone 15", buyPrice: 1, buyCount: 1, buyColor: "black"),
        buyItems(buyName: "iPad Pro", buyPrice: 2, buyCount: 2, buyColor: "green")
    ]
    
    @IBOutlet weak var bottomTableView: UITableView!
    

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var totalPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BottomCell", for: indexPath) as! BottomCell
        
        // 컬러를 데이터로는 안넘길건지?
        
        cell.buyColorInCell.image = .mango
        cell.buyCountInCell.titleLabel?.text = String(itemArray[indexPath.row].buyCount)
        cell.buyNameInCell.text = itemArray[indexPath.row].buyName
        cell.buyPriceInCell.text = String(itemArray[indexPath.row].buyPrice)
        
        return cell
    }

    // 초기 설정
    func configureUI() {
        
        bottomTableView.dataSource = self
        bottomTableView.rowHeight = 50
        
        cancelButton.setTitle("취 소", for: .normal)
        cancelButton.layer.cornerRadius = 18
        // cancelButton.layer.borderWidth = 2.0
        cancelButton.tintColor = .black
        cancelButton.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        // 혹시 블랙으로 할건지?
        // cancelButton.layer.borderColor = UIColor.black.cgColor
        // cancelButton.layer.borderColor = UIColor.lightGray.cgColor
        
        payButton.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        payButton.tintColor = .black
        payButton.setTitle("결제하기", for: .normal)
        payButton.layer.cornerRadius = 18
        
        totalPrice.text = "₩ 0"
    }
    
    

    
    
    
    
    
    
    @IBAction func payButtonTapped(_ sender: UIButton) {
        // 얼럿 설정
        let alertController = UIAlertController(title: "결제", message: "모든 주문에 무료 배송 서비스가 제공됩니다.", preferredStyle: .alert)
        
        // "결제" 버튼 설정
        let payAction = UIAlertAction(title: "결제", style: .default)
        
        // "삭제" 버튼 설정
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        // alertController에 "추가"와 "취소" 버튼을 편성
        alertController.addAction(payAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        // Cell에 받은 데이터를 초기화하기
    }
    
}

