//
//  ViewController.swift
//  Jovem Pan Fm Manaus
//
//  Created by Administrador on 20/10/16.
//  Copyright © 2016 EasyTiDev. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        /*CHAMA A FUNCAO beginReceivingRemoteControlEvents DO ARQUIVO APPDELEGATE.
         FOI COM ELA QUE CONSEGUIMOS RESOLVER O CONTROLE DO STREAMING VIA LOCK SCREEN E CENTRAL DE CONTROLE
         RESPONSÁVEL PELA ADAPTACAO: PATRIC OLIVEIRA
         */
        UIApplication.shared.beginReceivingRemoteControlEvents()
        self.becomeFirstResponder()
        
        /*CRIA UMA SESSAO DE AUDIO DO STREAMING EM EXECUÇÃO ATIVA E É UTILIZADA PELA FUNCAO ACIMA
         COMO BASE DE INFORMAÇÃO
         RESPONSÁVEL PELA ADAPTACAO: PATRIC OLIVEIRA
         */
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            print("AVAudioSession Category Playback OK")
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                print("AVAudioSession is Active")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        /* GERANDO INFORMAÇÕES PARA SEREM UTILIZADAS NO REMOTE CONTROL
         COMO NOME DA RÁDIO etc
         RESPONSÁVEL PELA ADAPTACAO: PATRIC OLIVEIRA
         */
        if NSClassFromString("MPNowPlayingInfoCenter") != nil {
            let image:UIImage = UIImage(named: "logo_player_background")! // comment this if you don't use an image
            let albumArt = MPMediaItemArtwork(image: image) // comment this if you don't use an image
            let songInfo = [
                MPMediaItemPropertyTitle: "Jovem Pan Manaus",
                MPMediaItemPropertyArtist: "104,1 fm",
                MPMediaItemPropertyArtwork: albumArt // comment this if you don't use an image
                ] as [String : Any]
            
            MPNowPlayingInfoCenter.default().nowPlayingInfo = songInfo
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

