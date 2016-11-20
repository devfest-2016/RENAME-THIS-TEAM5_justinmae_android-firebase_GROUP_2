//
//  ViewController.swift
//  InBetWin
//
//  Created by Arvin San Miguel on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var dealerCardImageView: UIImageView!
    @IBOutlet weak var playerCardOneImageView: UIImageView!
    @IBOutlet weak var playerCardTwoImageView: UIImageView!
    
    
    @IBOutlet weak var opponentCardOneImageView: UIImageView!
    @IBOutlet weak var opponentCardTwoImageView: UIImageView!
    
    @IBOutlet weak var dealerCardBGView: UIView!
    @IBOutlet weak var playerCardOneBGView: UIView!
    @IBOutlet weak var playerCardTwoBGView: UIView!
    
    @IBOutlet weak var cellUsernameLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var betAmountLabel: UILabel!
    @IBOutlet weak var totalTokensLabel: UILabel!
    

    
    @IBOutlet weak var higherButton: UIButton!
    @IBOutlet weak var lowerButton: UIButton!
    
    
    var store = CardAPIClient.shared
    var deck = Deck()
    
    var betAmountCounter: Int = 0
    var users: [String] = ["Michael", "Jhantelle", "Alexey", "Arvin", "Juyyt", "kstyi", "zsrhvb", "yxucfiu", "vgcfzchj", "jvfcfzdgg", "hjgdgfzkhbj", "kjgvhhfcxhg"]
    
    var flipped = true
    
    //test card
    let front = UIImageView(image: UIImage(named: "cardPlaceholder.png"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    @IBAction func betUpButtonTouched(_ sender: Any) {
        betAmountCounter += 5
        betAmountLabel.text = "$ \(betAmountCounter)"
        
    }
    
    @IBAction func betDownButtonTouched(_ sender: Any) {
        betAmountCounter -= 5
        betAmountLabel.text = "$ \(betAmountCounter)"
    }
    
    @IBAction func betButtonTouched(_ sender: Any) {
        
        

        if flipped {
            UIView.transition(from: playerCardOneImageView, to: front, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            flipped = false
        } else {
            UIView.transition(from: front, to: playerCardOneImageView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: nil)
            flipped = true
        }

        
    }
    
    @IBAction func foldButtonTouched(_ sender: Any) {
    }
    
    func updateView() {
        // Rounded Corners
        dealerCardImageView.layer.cornerRadius = 5.0
        dealerCardBGView.layer.cornerRadius = 7.0
        playerCardOneImageView.layer.cornerRadius = 5.0
        playerCardOneBGView.layer.cornerRadius = 7.0
        playerCardTwoImageView.layer.cornerRadius = 5.0
        playerCardTwoBGView.layer.cornerRadius = 7.0
        
        
        totalTokensLabel.layer.masksToBounds = true
        totalTokensLabel.layer.cornerRadius = 10.0
        
        
        // Shadow
        dealerCardBGView.layer.masksToBounds = false
        dealerCardBGView.layer.shadowColor = UIColor.black.cgColor
        dealerCardBGView.layer.shadowOpacity = 1
        dealerCardBGView.layer.shadowRadius = CGFloat(5)
        
        playerCardOneBGView.layer.masksToBounds = false
        playerCardOneBGView.layer.shadowColor = UIColor.black.cgColor
        playerCardOneBGView.layer.shadowOpacity = 1
        playerCardOneBGView.layer.shadowRadius = CGFloat(5)
        
        playerCardTwoBGView.layer.masksToBounds = false
        playerCardTwoBGView.layer.shadowColor = UIColor.black.cgColor
        playerCardTwoBGView.layer.shadowOpacity = 1
        playerCardTwoBGView.layer.shadowRadius = CGFloat(5)
        
        
    }
    
    // TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
        
        cell.cellUsernameLabel.text = users[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.updateCellView()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
        
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
            
        }
    }
    
    
    @IBAction func higherButtonTouched(_ sender: Any) {
    }
    
    @IBOutlet weak var lowerButtonTouched: UIButton!
    
}

