//
//  Rex.swift
//  ARDino
//
//  Created by Devin Eror on 7/15/17.
//  Copyright © 2017 Devin Eror. All rights reserved.
//

import ARKit

class Rex: SCNNode {
    
    func loadModel() {
        
        guard let virtualObjectScene = SCNScene(named: "art.scnassets/Rex-1.scn") else {return}
        
        let wrapperNode = SCNNode()
        
        for child in (virtualObjectScene.rootNode.childNodes) {
            
            wrapperNode.addChildNode(child)
        }
        
        self.addChildNode(wrapperNode)
    }
}
