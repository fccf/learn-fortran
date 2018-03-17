# learn-fortran
## 自动重分配
```fortran
character(:), allocatable :: s
real, allocatable :: r(:)
s = 'a'
s = 'abc'
s = 'abc def'
allocate(r(1))   !< size(r) = 1
r = [1.,2.,3.,4] !< size(r) = 4
```
## pure 程序
- pure程序不会对输入参数以及模块中的数据进行修改。局部变量不能有save属性，也不能初始化。

## elemental 程序
- elemental形参是标量，但输入参数可以是标量也可以是数组，如果是数组，则对数组中的每一个元素进行该操作。

## class(\*) 类型
- class(\*)作为输入参数可以实现多态，即输入参数可以为各种数据类型，然后在程序中使用 select type 来对各种不同的数据类型进行不同的操作，相同的操作可以公用。


## final 程序
- 一个类绑定的final子程序会在这个类的对象需要销毁的地方自动调用。这些地方包括：
  - [x] deallocate
  - [x] 程序结束
  - [x] 传递给intent(out)形参
  - [x] 等号左边

- final绑定的程序程序的输入只有一个参数，类型必须使用type而不是class。
- intent属性不能为(out)。
- 可以绑定多个程序。
- 参数可以是标量或数组，也可以是elemental 程序。
