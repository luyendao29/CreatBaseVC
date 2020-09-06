//
//  MasterTableViewCell.swift
//  CreatBaseVC
//
//  Created by Boss on 9/6/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell, UITextViewDelegate {
    
    @IBOutlet weak var strInstructionsTextView: UITextView!
    @IBOutlet weak var strDrinkThumbTextView: UITextView!
    @IBOutlet weak var dateModifiedTextView: UITextView!

    var infoCocktail: CocktailModel?
    var passData: ((_ data: CocktailModel) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dateModifiedTextView.delegate = self
        strInstructionsTextView.delegate = self
        strDrinkThumbTextView.delegate = self
    }
    
    func setData() {
        infoCocktail?.strInstructions = strInstructionsTextView.text
        infoCocktail?.strDrinkThumb = strDrinkThumbTextView.text
        infoCocktail?.dateModified = dateModifiedTextView.text
    }
    
    func fillData() {
        strInstructionsTextView.text = infoCocktail?.strInstructions
        strDrinkThumbTextView.text = infoCocktail?.strDrinkThumb
        dateModifiedTextView.text = infoCocktail?.dateModified
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    static func identifier() -> String {
        return "MasterTableViewCell"
    }
    
    func textViewDidChange(_ textView: UITextView) {
        setData()
        passData?(infoCocktail ?? CocktailModel())
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
