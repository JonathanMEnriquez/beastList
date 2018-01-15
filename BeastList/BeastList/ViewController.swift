//
//  ViewController.swift
//  BeastList
//
//  Created by user on 1/15/18.
//  Copyright © 2018 jon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var wordArray:[String] = []
    
    @IBOutlet var myTextField: UITextField!
    
    @IBOutlet var myTableView: UITableView!
    
    // Button pressed
    
    @IBAction func beastButtonIsPressed(_ sender: UIButton) {
        
        if myTextField.text == nil {
            return
        }
        
        if let newWord = myTextField.text {
            
            wordArray.append(newWord)
            myTableView.reloadData()
        }
        else {
            return
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    // Protocol and Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = wordArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        wordArray.remove(at: indexPath.row)
        myTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

