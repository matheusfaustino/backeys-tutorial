# idle
extends State

@export var fall_state: State
@export var jump_state: State
@export var move_state: State

func enter() -> void:
    super()
    parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
    #if Input.is_action_just_pressed("jump") and parent.is_on_floor():
        #return jump_state
#
    #if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right") \
        #or Input.is_action_pressed("move_left")  or Input.is_action_pressed("move_right"):
        #return move_state

    return null

func process_physics(delta: float) -> State:
    if Input.is_action_just_pressed("jump") and parent.is_on_floor():
        return jump_state

    if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right") \
        or Input.is_action_pressed("move_left")  or Input.is_action_pressed("move_right"):
        return move_state

    parent.velocity.y += gravity * delta
    parent.move_and_slide()

    if parent.is_on_floor() == false:
        return fall_state

    return null
