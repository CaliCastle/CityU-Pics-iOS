//
//  LoginTextField.swift
//  CityU Pics
//
//  Created by Cali Castle  on 9/22/17.
//  Copyright © 2017 Cali Castle . All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class LoginTextField: UIView {

    @IBOutlet var view: LoginTextField!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var placeholder: UILabel!
    
    @IBInspectable var placeholderText: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        view = loadViewFromNib() as! LoginTextField!
        view.frame = bounds
        
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth,
                                 UIViewAutoresizing.flexibleHeight]
        
        addSubview(view)
    }
    
    func setup() {
//        placeholder.text = placeholderText
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
}
