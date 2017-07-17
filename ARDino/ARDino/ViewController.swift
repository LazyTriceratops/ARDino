//
//  ViewController.swift
//  ARDino
//
//  Created by Devin Eror on 7/15/17.
//  Copyright © 2017 Devin Eror. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let config = ARWorldTrackingSessionConfiguration()
        
        sceneView.session.run(config)
        
        addObject()
    }
    
    func addObject() {
        
        let dino = Rex()
        dino.loadModel()
        
        let xPos = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        let yPos = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        
        dino.position = SCNVector3(xPos, yPos, -1)
        sceneView.scene.rootNode.addChildNode(dino)
    }
    
    func randomPosition(lowerBound lower:Float, upperBound upper:Float) -> Float {
        
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
            if let touch = touches.first {
                let location = touch.location(in: sceneView)
                
                let hitList = sceneView.hitTest(location, options: nil)
                if let hitObject = hitList.first {
                    
                    let node = hitObject.node
                    if node.name == "Dino" {
                        
                        node.removeFromParentNode()
                        addObject()
                    }
                }
            }
        }
}
