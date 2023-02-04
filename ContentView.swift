//
//  ContentView.swift
//  UGAHacks8
//
//  Created by Will Gautreaux on 2/3/23.
//

import SwiftUI
import RealityKit
import RealityGeometries


struct ContentView : View {
    var body: some View {
//        VStack(alignment: .leading) {
            ARViewContainer().edgesIgnoringSafeArea(.all)
//            HStack() {
//                Button("Testing1") {
//                    print("Button clicked1")
//                }
//                Spacer()
//                Button("Testing2") {
//                    print("Button clicked2")
//                }
//                Spacer()
//                Button("Testing3") {
//                    print("Button clicked3")
//                }
//
//            }
//        }
    }
}

//public class Tree: Entity {
//    private let trunk = ModelEntity()
//    private let top = ModelEntity()
//
//}

class Coordinator: NSObject {
    weak var view: ARView?
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        
        guard let view = self.view else { return }
        
        let tapLocation = recognizer.location(in: view)
        
        if let entity = view.entity(at: tapLocation) as? ModelEntity {
            entity.model?.materials = [SimpleMaterial(color: .red, isMetallic: true)]
        }
        
    }
}

struct ARViewContainer: UIViewRepresentable {
    
//    @IBOutlet var arView: ARView!
    
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView()
        context.coordinator.view = arView
        
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        
        do {
            
            // Vars for controlling scale
            let trunkHeight = 1.5
            let trunkRadius = 0.2 //actually diameter
            let branchHeight = 0.3
            // -------------
            // Create models

            
            // Create meshes
//            let trunk = try MeshResource.generateCylinder(radius: Float(trunkRadius), height: Float(trunkHeight), splitFaces: false)
//            let trunk = try MeshResource.
//            let trunk = MeshResource.generateBox(size: 1)
//            let treeTop = try MeshResource.generateCone(radius: Float(trunkRadius * 2), height: 0.8)
            
            // Branches
            let bondBranch = try MeshResource.generateCylinder(radius: 0.02, height: Float(branchHeight), splitFaces: false)
            let mortgageBranch = try MeshResource.generateCylinder(radius: 0.02, height: Float(branchHeight), splitFaces: false)
            let govBranch = try MeshResource.generateCylinder(radius: 0.02, height: Float(branchHeight), splitFaces: false)
            let techBranch = try MeshResource.generateCylinder(radius: 0.02, height: Float(branchHeight), splitFaces: false)
            let retailBranch = try MeshResource.generateCylinder(radius: 0.02, height: Float(branchHeight), splitFaces: false)
            let mutualBranch = try MeshResource.generateCylinder(radius: 0.02, height: Float(branchHeight), splitFaces: false)
            let retirementBranch = try MeshResource.generateCylinder(radius: 0.02, height: Float(branchHeight), splitFaces: false)
            
            let leafBranch = try MeshResource.generateCylinder(radius: 0.01, height: 0.05, splitFaces: false)
//            let leaf = MeshResource.generatePlane(width: 0.1, depth: 0.05)


            
            // Create materials
//            let trunkMaterial = SimpleMaterial(color: .brown, roughness: 0, isMetallic: false)
//            let treeTopMaterial = SimpleMaterial(color: ., roughness: 0, isMetallic: false)
            let branchMaterial = SimpleMaterial(color: .brown, roughness: 0, isMetallic: false)
//            let leafMaterial = SimpleMaterial(color: .green, roughness: 0, isMetallic: false)

            // Create entities
//            let trunkEntity = ModelEntity(mesh: trunk, materials: [trunkMaterial])
            let trunkEntity = try Entity.loadModel(named: "Tree")
//            let treeTopEntity = ModelEntity(mesh: treeTop, materials: [treeTopMaterial])
            
            let bondBranchEntity = ModelEntity(mesh: bondBranch, materials: [branchMaterial])
            let mortgageBranchEntity = ModelEntity(mesh: mortgageBranch, materials: [branchMaterial])
            let govBranchEntity = ModelEntity(mesh: govBranch, materials: [branchMaterial])
            let techBranchEntity = ModelEntity(mesh: techBranch, materials: [branchMaterial])
            let retailBranchEntity = ModelEntity(mesh: retailBranch, materials: [branchMaterial])
            let mutualBranchEntity = ModelEntity(mesh: mutualBranch, materials: [branchMaterial])
            let retirementBranchEntity = ModelEntity(mesh: retirementBranch, materials: [branchMaterial])
            
            let leafBranchEntity = ModelEntity(mesh: leafBranch, materials: [branchMaterial])
//            let leafEntity = ModelEntity(mesh: leaf, materials: [leafMaterial])
            
            // finalLeaf
//            leafEntity.setPosition(SIMD3<Float>(0, 0, 0), relativeTo: leafBranchEntity)
//            leafBranchEntity.addChild(leafEntity)
            
            

            
            trunkEntity.generateCollisionShapes(recursive: true)
//            treeTopEntity.generateCollisionShapes(recursive: true)
            
            bondBranchEntity.generateCollisionShapes(recursive: true)
            mortgageBranchEntity.generateCollisionShapes(recursive: true)
            govBranchEntity.generateCollisionShapes(recursive: true)
            techBranchEntity.generateCollisionShapes(recursive: true)
            retailBranchEntity.generateCollisionShapes(recursive: true)
            mutualBranchEntity.generateCollisionShapes(recursive: true)
            retirementBranchEntity.generateCollisionShapes(recursive: true)
            
//            print("Y: ", trunkEntity)
//            trunkEntity.setPosition(SIMD3(x: 0, y: 1, z: 0), relativeTo: trunkEntity)
//            treeTopEntity.setPosition(SIMD3(x: 0, y: Float(trunkHeight / 2), z:0), relativeTo: trunkEntity)
            
            bondBranchEntity.setPosition(SIMD3(x: 0, y: Float(trunkHeight * 0.8), z: Float(branchHeight)), relativeTo: trunkEntity)
            mortgageBranchEntity.setPosition(SIMD3(x: 0, y: Float(trunkHeight * 0.4), z: Float(branchHeight)), relativeTo: trunkEntity)
            govBranchEntity.setPosition(SIMD3(x: Float(branchHeight), y: Float(trunkHeight * 0.7), z: 0), relativeTo: trunkEntity)
            techBranchEntity.setPosition(SIMD3(x: Float(branchHeight), y: Float(trunkHeight * 0.3), z: 0), relativeTo: trunkEntity)
            retailBranchEntity.setPosition(SIMD3(x: 0, y: Float(trunkHeight * 0.45), z: -Float(branchHeight)), relativeTo: trunkEntity)
            mutualBranchEntity.setPosition(SIMD3(x: 0, y: Float(trunkHeight * 0.9), z: -Float(branchHeight)), relativeTo: trunkEntity)
            retirementBranchEntity.setPosition(SIMD3(x: -Float(branchHeight), y: Float(trunkHeight * 0.6), z: 0), relativeTo: trunkEntity)
            
            bondBranchEntity.transform.rotation += simd_quatf(angle: .pi / 2, axis: SIMD3<Float>(1, 0, 0)) // Rotate branch cylinder by 90deg
            mortgageBranchEntity.transform.rotation += simd_quatf(angle: .pi / 2, axis: SIMD3<Float>(1, 0, 0)) // Rotate branch cylinder by 90deg
            govBranchEntity.transform.rotation += simd_quatf(angle: .pi / 2, axis: SIMD3<Float>(0, 0, 1))
            techBranchEntity.transform.rotation += simd_quatf(angle: .pi / 2, axis: SIMD3<Float>(0, 0, 1))
            retailBranchEntity.transform.rotation += simd_quatf(angle: .pi / 2, axis: SIMD3<Float>(1, 0, 0))
            mutualBranchEntity.transform.rotation += simd_quatf(angle: .pi / 2, axis: SIMD3<Float>(1, 0, 0))
            retirementBranchEntity.transform.rotation += simd_quatf(angle: .pi / 2, axis: SIMD3<Float>(0, 0, 1))
//            bondBranchEntity.transform.rotation += simd_quatf(angle: .pi / 2, axis: SIMD3<Float>(1, 0, 0)) // Rotate branch cylinder by 90deg

            
            
            // Assign entities to correct parent entities
//            trunkEntity.addChild(treeTopEntity)
            trunkEntity.addChild(bondBranchEntity)
            trunkEntity.addChild(mortgageBranchEntity)
            trunkEntity.addChild(govBranchEntity)
            trunkEntity.addChild(techBranchEntity)
            trunkEntity.addChild(retailBranchEntity)
            trunkEntity.addChild(mutualBranchEntity)
            trunkEntity.addChild(retirementBranchEntity)
            
//            trunkEntity.
            
            placeTree(tree: trunkEntity, at: SIMD3(x: 0, y: 0, z: 0))

            // Gestures
            installGestures(on: trunkEntity)
            
            // -------------
            // Create anchors
            
            // Binding trunk anchor to floor anchor
//            let trunkAnchor = AnchorEntity(plane: .horizontal, classification: .floor, minimumBounds: [0.2, 0.2])
//            trunkAnchor.addChild(trunkEntity)
            
            
            // -------------------
            // Add anchor to scene
//            arView.scene.addAnchor(trunkAnchor)
            
            
            // ------------------
            // Logic for entities
                        
            print("TESTING")
            return arView
        } catch {
            print("ERROR!!")
            return arView
        }
        
        func placeTree(tree: ModelEntity, at position: SIMD3<Float>) {
            let treeAnchor = AnchorEntity(.plane([.horizontal], classification: [.floor], minimumBounds: [0.5, 0.5]))
            treeAnchor.addChild(tree)
            
            arView.scene.addAnchor(treeAnchor)
        }
        
        func installGestures(on object: ModelEntity) {
            
            object.generateCollisionShapes(recursive: true)
            arView.installGestures(.all , for: object)
        }
        
        
    }
    
    
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    
}


// This is for displaying on computer. delete if annoyed
//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
