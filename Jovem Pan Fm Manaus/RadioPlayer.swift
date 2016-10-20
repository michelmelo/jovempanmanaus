//
//  RadioPlayer.swift
//  Jovem Pan Fm Manaus
//
//  Created by Administrador on 20/10/16.
//  Copyright © 2016 EasyTiDev. All rights reserved.
//

import Foundation
import AVFoundation
import MediaPlayer

class RadioPlayer {
    
    static let sharedInstance = RadioPlayer()//INSTANCIA CRIADA PARA CONTROLAR O PLAY
    
    private var player = AVPlayer(url: URL(string: "http://servidor1.crossdigital.com.br:8152")!)
    private var isPlaying = false
    
    func mudaVolume(volume: Float){
        player.volume = volume
    }
    
    func play() {
        player.play()
        print(player.reasonForWaitingToPlay)
        isPlaying = true
    }
    
    func pause() {
        player.pause()
        isPlaying = false
    }
    
    func toggle() {
        if isPlaying == true {
            pause()
        } else {
            play()
        }
    }
    
    func currentlyPlaying() -> Bool {
        return isPlaying
    }
    
}

