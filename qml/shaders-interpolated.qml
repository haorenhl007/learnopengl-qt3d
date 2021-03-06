import Qt3D.Core 2.0
import Qt3D.Render 2.0

import "Components"

Scene0 {
	Entity {
		id: root

		RenderSettings0 {}

		Entity {
			id: plane

			GeometryRenderer {
				id: geometry
				geometry: Geometry {
					boundingVolumePositionAttribute: position

					Attribute {
						id: position
						attributeType: Attribute.VertexAttribute
						vertexBaseType: Attribute.Float
						vertexSize: 3
						count: 3
						byteOffset: 0
						byteStride: 6 * 4
						name: "position"
						buffer: vertexBuffer
					}

					Attribute {
						attributeType: Attribute.VertexAttribute
						vertexBaseType: Attribute.Float
						vertexSize: 3
						count: 3
						byteOffset: 3 * 4
						byteStride: 6 * 4
						name: "color"
						buffer: vertexBuffer
					}
				}

				Buffer {
					id: vertexBuffer
					type: Buffer.VertexBuffer
					data: new Float32Array([
						 0.5, -0.5,  0.0,  1.0,  0.0,  0.0, // Bottom Right
						-0.5, -0.5,  0.0,  0.0,  1.0,  0.0, // Bottom Left
						 0.0,  0.5,  0.0,  0.0,  0.0,  1.0, // Top
					])
				}
			}

			Material {
				id: material
				effect: Effect {
					techniques: AutoTechnique {
						renderPasses: RenderPass {
							renderStates: CullFace { mode: CullFace.NoCulling }
							shaderProgram: AutoShaderProgram {
								vertName: "shaders-uniform"
								fragName: "shaders-interpolated"
							}
						}
					}
				}
			}

			components: [geometry, material]
		}
	}
}
