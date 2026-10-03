## Editor plugin entry point. Registers the inspector plugin that shows a
## Node3D's live global position/rotation in the Inspector.
@tool
extends EditorPlugin

const GlobalTransformInspectorPlugin = preload("res://addons/global_transform_inspector/inspector_plugin.gd")

var inspectorPlugin: EditorInspectorPlugin


func _enter_tree() -> void:
	inspectorPlugin = GlobalTransformInspectorPlugin.new()
	add_inspector_plugin(inspectorPlugin)


func _exit_tree() -> void:
	remove_inspector_plugin(inspectorPlugin)
