module learn_final
  implicit none
  !=============================================================================
  type foo
    real,allocatable :: v(:)
  contains
    procedure :: allocate => foo_allocate
    procedure :: destory  => foo_destory
    final     :: foo_final, foo_final_array
  end type foo
contains
  !=============================================================================
  subroutine foo_allocate(this, n)
    class(foo), intent(out) :: this
    integer, intent(in) ::  n
    allocate(this%v(n))
  end subroutine foo_allocate
  !=============================================================================
  elemental subroutine foo_destory(this)
    class(foo), intent(inout) :: this
    if(allocated(this%v)) deallocate(this%v)
  end subroutine foo_destory
  !=============================================================================
  subroutine foo_final(this)
    type(foo), intent(inout) :: this
    call this%destory()
    print*, 'call final'
  end subroutine foo_final
  !=============================================================================
  subroutine foo_final_array(this)
    type(foo), intent(inout) :: this(:)
    call this%destory()
    print*, 'call final_array'
  end subroutine foo_final_array
end module learn_final

program final_test
  use learn_final
  implicit none

  call t0
  call t1
  call t2
  call t3

contains
  subroutine t0
    type(foo) :: bar
    bar = foo()
    print*, "test auto deallocate when end subroutine."
    print*, 'end procedure'
  end subroutine t0

  subroutine t1
    type(foo) :: bar
    print*, "test auto deallocate when intent(out)."
    call bar%allocate(4)
    print*, 'end procedure'
  end subroutine t1

  subroutine t2
    type(foo), allocatable:: bar(:)
    print*, "test auto deallocate when deallocate"
    allocate(bar(3))
    deallocate(bar)
    print*, 'end procedure'
  end subroutine t2

  subroutine t3  !< won't call final when in lhs of = ?
    type(foo) :: bar1, bar
    bar1 = foo([1])
    bar = foo([1.,2.,3.])
    print*, "test auto deallocate when in lhs of = "
    bar1 = bar
    print*, 'end procedure'
  end subroutine t3

end program final_test
