//
//  LoginTextField.swift
//  CityU Pics
//
//  Created by Cali Castle  on 9/22/17.
//  Copyright © 2017 Cali Castle . All rights reserved.
//

import UIKit

@IBDesignable
class LoginTextField: UIView {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var placeholder: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
