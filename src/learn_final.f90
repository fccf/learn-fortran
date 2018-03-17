module learn_final

  implicit none

  type type_t
    real,allocatable :: rv(:)
  contains
    procedure :: allocate
    procedure :: destory
    final     :: deallcate, deallcate_a
  end type type_t

contains
  subroutine allocate(this, n)
    class(type_t), intent(out) :: this
    integer, intent(in) ::  n
    allocate(this%rv(n))
    this%rv = 0.0
  end subroutine allocate

  elemental subroutine destory(this)
    class(type_t), intent(inout) :: this
    if(allocated(this%rv)) deallocate(this%rv)
  end subroutine destory

  subroutine deallcate(this)
    type(type_t), intent(inout) :: this
    call this%destory()
    print*, 'deallcate data'
  end subroutine deallcate

  subroutine deallcate_a(this)
    type(type_t), intent(inout) :: this(:)
    call this%destory()
    print*, 'deallcate array'
  end subroutine deallcate_a

end module learn_final

program final_test
  use learn_final
  implicit none

  call t1
  call t2
  call t3

contains
  subroutine t1
    type(type_t) :: ts
    print*, ">> test auto deallocate by intent(out)."
    call ts%allocate(4)
    print*, '<< end procedure'
  end subroutine t1

  subroutine t2
    type(type_t), allocatable:: tv(:)
    print*, ">> test auto deallocate by procedure return."
    allocate(tv(1))
    call tv(1)%allocate(4)
    print*, '<< end procedure'
  end subroutine t2

  subroutine t3
    type(type_t), allocatable:: tv(:)
    print*, ">> test auto deallocate by deallocate"
    allocate(tv(1))
    call tv(1)%allocate(4)
    deallocate(tv)
    print*, '<< end procedure'
  end subroutine t3

end program final_test
