# move
extends State

@export var fall_state: State
@export var idle_state: State
@export var jump_state: State

func enter() -> void:
    super()

func process_physics(delta: float) -> State:
    if Input.is_action_just_pressed("jump") and parent.is_on_floor():
        return jump_state

    if parent.is_on_floor() == false:
        return fall_state

    var direction = Input.get_axis("move_left", "move_right")
    if direction == 0 and parent.velocity.x == 0 and parent.is_on_floor():
        return idle_state

    if direction != 0:
        parent.animated_sprite.flip_h = direction < 0

    if direction:
        parent.velocity.x = direction * move_speed
    else:
        parent.velocity.x = move_toward(parent.velocity.x, 0, move_speed)
    parent.move_and_slide()

    return null
