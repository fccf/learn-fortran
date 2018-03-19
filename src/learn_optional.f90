program learn_optional

  implicit none

  call optional()
  call optional(i=1)
  call optional(r=2.0)
  call optional(i=3,r=4.0)

contains

  subroutine optional(i,r)
    integer, intent(in), optional :: i
    real, intent(in), optional :: r

    integer :: li
    real :: lr

    li = merge(i, 10, present(i))
    lr = merge(r, 3.14, present(r))

    print*, 'li = ',li
    print*, 'lr = ',lr

  end subroutine optional


end program learn_optional
