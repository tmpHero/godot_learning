参考b站教程修改，可能会存在b站教程残留的函数没有调用

## item

使用 Resource 创建 Item，
包含最简单的

```gdscript
@export var id: StringName = ""               # 唯一标识符
@export var name: String = "Unnamed"      # 显示名称
@export var texture: Texture2D            # 图标
@export var max_stack: int = 64            # 最大堆叠数
@export var quantity: int = 1             # 当前数量

```

inventory.gd 包含 slots ，代表多大的背包或箱子

bag.tres 继承 inventory.gd

inventory_ui.gd 里 是对应的逻辑处理

目前只有拿起物品，交换物品，合并相同物品（检查是否能叠加），更新保存

加载 bag.tres ，绑定对应格子，鼠标会自带一个格子有物品的时候显示否则隐藏，当背包内东西更新的时候会更新交换的位置，由于godot里面 Resource 资源是引用，还会深拷贝一下让对应资源唯一化，再保存到原文件

逻辑

背包：Array[Item] = [null, null, null, null]

鼠标 mouse_item

鼠标点击背包对应格子，Array[index] 与 mouse_item 进行逻辑判断

## state_machine

使用节点绑定状态，一个父节点管理多个子节点，每个子节点是一个状态
父节点只需要绑定 StateMachine\state_machine.gd ，脚本实现了获取所有子节点，并且把子节点的名字当作状态名称
子节点继承 StateMachine\state.gd 脚本定义的抽象类，
实现最基本的：

1. 进入状态
2. 退出状态
3. 状态切换条件
4. 逻辑上的进程运行
5. 物理碰撞的进程运行
