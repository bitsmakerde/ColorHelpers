//
//  Entity+GroundingShadow.swift
//  ObjectGestures
//
//  Extension to add grounding shadow components to entity hierarchies

import RealityKit

extension Entity {
    /// Assigns a `GroundingShadowComponent` to all `ModelEntity` objects in the hierarchy.
    ///
    /// Note: May create performance problems if more than a dozen grounding shadows are assigned.
    @available(macOS 15.0, iOS 18.0, visionOS 2.0, *)
    public func generateGroundingShadowComponents() {
        enumerateHierarchy { entity in
            if entity is ModelEntity {
                entity.components.set(GroundingShadowComponent(castsShadow: true))
            }
        }
    }

    private func enumerateHierarchy(_ body: (Entity) -> Void) {
        func enumerate(_ body: (Entity) -> Void) {
            body(self)
            for child in children {
                child.enumerateHierarchy(body)
            }
        }
        enumerate(body)
    }
}
