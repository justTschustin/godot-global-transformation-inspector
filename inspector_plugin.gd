## Tells the editor which objects get the custom global-transform display:
## every Node3D gets a read-only block showing its live global position/rotation.
@tool
extends EditorInspectorPlugin

const GlobalTransformControl = preload("res://addons/global_transform_inspector/global_transform_control.gd")


func _can_handle(object: Object) -> bool:
	return object is Node3D


func _parse_begin(object: Object) -> void:
	add_custom_control(GlobalTransformControl.new(object as Node3D))
