## Read-only inspector widget showing a Node3D's live global position and
## rotation. The inspector does not auto-refresh custom controls, so this
## polls the target node every frame while visible.
@tool
extends VBoxContainer

var targetNode: Node3D

var positionLabel: Label
var rotationLabel: Label


func _init(node: Node3D) -> void:
	targetNode = node

	var title := Label.new()
	title.text = "Global Transform"
	title.add_theme_font_size_override("font_size", 14)
	add_child(title)

	positionLabel = Label.new()
	rotationLabel = Label.new()
	add_child(positionLabel)
	add_child(rotationLabel)

	set_process(true)


func _process(_delta: float) -> void:
	if not is_instance_valid(targetNode):
		set_process(false)
		return

	var globalPosition := targetNode.global_position
	var globalRotationDegrees := targetNode.global_rotation_degrees

	positionLabel.text = "Position: (%.2f, %.2f, %.2f)" % [globalPosition.x, globalPosition.y, globalPosition.z]
	rotationLabel.text = "Rotation: (%.2f, %.2f, %.2f)" % [globalRotationDegrees.x, globalRotationDegrees.y, globalRotationDegrees.z]
