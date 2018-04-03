program learn_array
  use iso_fortran_env
  implicit none

  call test_1
  call test_2
  call test_3
  call test_4

contains
  subroutine test_1()
    integer, parameter   :: ivp(*) = [1,2,3,4,5]
    integer, allocatable :: iv(:)
    iv = [1,2,3,4,5]
    if(all(iv==ivp)) print*, 'pass'
  end subroutine test_1

  subroutine test_2()
    implicit none
    integer, parameter   :: ivp(*) = [1,2,3,4,5]
    integer, allocatable :: iv(:)
    iv = (/1,2,3/)  !< allocate lhs， another array constructor
    iv = [1,2,3,4,5] !< reallocate lhs
    if(all(iv==ivp)) print*, 'pass'
  end subroutine test_2

  subroutine test_3()
    integer, parameter   :: ivp(*) = [1,2,3,4,5]
    integer, allocatable :: iv(:)
    integer :: i
    iv = [integer ::]
    do i = 1,5
      iv = [iv,i]
    enddo
    if(all(iv==ivp)) print*, 'pass'
  end subroutine test_3

  subroutine test_4()
    integer, parameter   :: ivp(*) = [1,2,3,4,5]
    integer, allocatable :: iv(:)
    integer :: i, ios, unit
    iv = [integer ::]
    open(newunit = unit, file='test.txt')
    do
      read(unit=unit,fmt=*,iostat=ios) i
      if(ios /= 0) exit
      iv = [iv,i]
    enddo
    close(unit)
    if(all(iv==ivp)) print*, 'pass'
  end subroutine test_4

end program learn_array
