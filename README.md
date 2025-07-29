## item
<<<<<<< HEAD

=======
>>>>>>> 45881ab958ff4190ca174326f5320842a8b7d01a
使用 Resource 创建 Item，
包含最简单的

```gdscript
@export var id: StringName = ""               # 唯一标识符
@export var name: String = "Unnamed"      # 显示名称
@export var texture: Texture2D            # 图标
@export var max_stack: int = 64            # 最大堆叠数
@export var quantity: int = 1             # 当前数量

<<<<<<< HEAD
```


## state_machine

=======

## state_machine
>>>>>>> 45881ab958ff4190ca174326f5320842a8b7d01a
使用节点绑定状态，一个父节点管理多个子节点，每个子节点是一个状态
父节点只需要绑定 StateMachine\state_machine.gd ，脚本实现了获取所有子节点，并且把子节点的名字当作状态名称
子节点继承 StateMachine\state.gd 脚本定义的抽象类，
实现最基本的：
<<<<<<< HEAD

1. 进入状态
2. 退出状态
3. 状态切换条件
4. 逻辑上的进程运行
5. 物理碰撞的继承运行
=======
  1. 进入状态
  2. 退出状态
  3. 状态切换条件
  4. 逻辑上的进程运行
  5. 物理碰撞的继承运行
>>>>>>> 45881ab958ff4190ca174326f5320842a8b7d01a
