//
//  HWTextFieldTableViewCell.swift
//  HandwritoProjet
//
//  Created by lan yu on 07/01/2017.
//  Copyright © 2017 lan yu. All rights reserved.
//

import UIKit

@objc protocol HWTextFieldTableViewCellDelegate {
    @objc optional func textFieldShouldReturn(_ text: String)
    @objc optional func textFieldDidBeginEditing(_ text: String)
    @objc optional func textFieldDidEndEditing(_ text: String)
}


class HWTextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    var action: (() -> Void)?
    
    weak var delegate: HWTextFieldTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField.delegate = self
    }
    
    @IBAction func buttonPushed() {
        self.textField.resignFirstResponder()
        self.action?()
    }
}

extension HWTextFieldTableViewCell: UITextFieldDelegate {
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.delegate?.textFieldShouldReturn?(textField.text ?? "")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.delegate?.textFieldDidBeginEditing?(textField.text ?? "")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate?.textFieldDidEndEditing?(textField.text ?? "")
    }
}

