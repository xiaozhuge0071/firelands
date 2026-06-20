extends RichTextLabel

var load:="--------------------"
var char:=0
var speed:=0.1

func _ready():
	text=""
	char=0
	await get_tree().create_timer(0.2).timeout
	_loading()

func _loading():
	while char<load.length():
		text+=load[char]
		char+=1
		await get_tree().create_timer(speed).timeout
