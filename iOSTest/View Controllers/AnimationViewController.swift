//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class AnimationViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     **/
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var btnFadeIn: UIButton!
    private var isFadeIn: Bool = false

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animation"
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        let mainMenuViewController = MenuViewController()
        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    @IBAction func didPressFade(_ sender: Any) {
        btnFadeIn.isEnabled = false
        if (isFadeIn) {
            btnFadeIn.setTitle("Fade In", for: .normal)
            UIView.animate(
                withDuration: 1.0,
                delay       : 0,
                options     : .curveEaseOut,
                animations  : {
                     self.imgLogo.alpha = 1
                },
                completion  : { bCompleted in
                    self.isFadeIn = false
                    self.btnFadeIn.isEnabled = true
                }
            )
        }
        else {
            btnFadeIn.setTitle("Fade Out", for: .normal)
            UIView.animate(
                withDuration: 1.0,
                delay       : 0,
                options     : .curveEaseOut,
                animations  : {
                     self.imgLogo.alpha = 0
                },
                completion  : { bCompleted in
                    self.isFadeIn = true
                    self.btnFadeIn.isEnabled = true
                }
            )
        }
    }
}
