//
//  Animator.swift
//  MyTVShows
//
//  Created by Juan Jose Elias Navarro on 30/08/21.
//

import UIKit

/**
 A helper for animatios with UI elements.
 
 - Author: Juan Jose Elias Navarro.
 
 - Note: All the methods are statics and is **not** necesary initilize and object for this class.
 */
class Animator {
    
    /**
     Animation for buttons press down.
     
     The button reduces its size a little bit and uses the *haptic feedback* to notify the user that the buttons has been pressed.
     
     - Parameter sender: The button that will be animated
    */
    static func animatePressDown(_ sender: UIView) {
        let scaleDown:CGAffineTransform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        UIView.animate(withDuration: 0.125, delay: 0.0, options: .curveEaseOut, animations: {
            sender.transform = scaleDown
        }) { (finished) in
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        }
    }
    
    /**
     Animation for buttons press up.
     
     The button returns to its original size after been pressed.
     
     - Parameter sender: The button that will be animated
     */
    static func animatePressUp(_ sender: UIView) {
        UIView.animate(withDuration: 0.125, delay: 0.0, options: .curveEaseIn, animations: {
            sender.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    /**
     Shake animation for any UIView
     The view will shake from left to right and it's compatible with an *error haptic feedback*.
     
     - Parameter sender: The view that will be animated
     */
    static func animateShake(_ sender: UIView) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = moveToRight(20)
        } completion: { finished in
            UIView.animate(withDuration: 0.1) {
                sender.transform = moveToLeft(20)
            } completion: { finished in
                UIView.animate(withDuration: 0.1) {
                    sender.transform = moveToRight(12)
                } completion: { finished in
                    UIView.animate(withDuration: 0.1) {
                        sender.transform = moveToLeft(12)
                    } completion: { finished in
                        UIView.animate(withDuration: 0.1) {
                            sender.transform = moveToRight(5)
                        } completion: { finished in
                            UIView.animate(withDuration: 0.1) {
                                sender.transform = .identity
                            }
                        }

                    }

                }

            }

        }
    }
    
    static private func moveToRight(_ points: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: points, y: 0)
    }
    
    static private func moveToLeft(_ points: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(translationX: -points, y: 0)
    }
}


