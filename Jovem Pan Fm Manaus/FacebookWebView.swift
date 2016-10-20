//
//  FacebookWebView.swift
//  Jovem Pan Fm Manaus
//
//  Created by Administrador on 20/10/16.
//  Copyright © 2016 EasyTiDev. All rights reserved.
//

import Foundation
import UIKit

class FacebookViewController: UIViewController {
    
    @IBOutlet weak var faceWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //
        let facebookURL = URL (string: "https://www.facebook.com/pages/Radio-Jovem-Pan-Manaus/240613879312409?fref=ts")
        let facebookURLRequest = URLRequest (url: facebookURL!)
        faceWebView.loadRequest(facebookURLRequest)
        //REFERENCIAS DA PROPRIA WEBVIEW, SEGUIDA DA REQUISIÇÃO, PASSANDO COMO PARAMETRO A VARIÁVEL QUE RECEBE O OBJETO CONTENDO A URL
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func goBack(_ sender: AnyObject) {
        faceWebView.goBack()
    }
    @IBAction func goForward(_ sender: AnyObject) {
        faceWebView.goForward()
    }
    
    
}
