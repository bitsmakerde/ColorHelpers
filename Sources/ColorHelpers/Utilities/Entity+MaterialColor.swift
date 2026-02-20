//
//  Entity+MaterialColor.swift
//  ObjectGestures
//
//  Utilities for changing material colors on RealityKit entities

import RealityKit

#if canImport(UIKit)
import UIKit

/// Change the PBR material color for named entity parts in a hierarchy
@MainActor
public func changeColorOf(parts: [String], to colorHex: String, in root: Entity) {
    for bodyPart in parts {
        if let part = root.findEntity(named: bodyPart) {
            if let modelComponent = part.components[ModelComponent.self] {
                let newModelComponent = setPBMaterial(
                    modelComponent: modelComponent,
                    color: uiColorFromHex(hex: colorHex)
                )
                part.components[ModelComponent.self] = newModelComponent
            }
        }
    }
}

/// Set the base color tint on all PhysicallyBasedMaterial instances in a ModelComponent
public func setPBMaterial(modelComponent: ModelComponent, color: UIColor) -> ModelComponent {
    var modelComponent = modelComponent
    var newMaterials = modelComponent.materials
    for i in 0..<newMaterials.count {
        if var material = newMaterials[i] as? PhysicallyBasedMaterial {
            material.baseColor.tint = color
            newMaterials[i] = material
        }
    }
    modelComponent.materials = newMaterials
    return modelComponent
}

#elseif canImport(AppKit)
import AppKit

/// Change the PBR material color for named entity parts in a hierarchy
@MainActor
public func changeColorOf(parts: [String], to colorHex: String, in root: Entity) {
    for bodyPart in parts {
        if let part = root.findEntity(named: bodyPart) {
            if let modelComponent = part.components[ModelComponent.self] {
                let newModelComponent = setPBMaterial(
                    modelComponent: modelComponent,
                    color: uiColorFromHex(hex: colorHex)
                )
                part.components[ModelComponent.self] = newModelComponent
            }
        }
    }
}

/// Set the base color tint on all PhysicallyBasedMaterial instances in a ModelComponent
public func setPBMaterial(modelComponent: ModelComponent, color: NSColor) -> ModelComponent {
    var modelComponent = modelComponent
    var newMaterials = modelComponent.materials
    for i in 0..<newMaterials.count {
        if var material = newMaterials[i] as? PhysicallyBasedMaterial {
            material.baseColor.tint = color
            newMaterials[i] = material
        }
    }
    modelComponent.materials = newMaterials
    return modelComponent
}
#endif
