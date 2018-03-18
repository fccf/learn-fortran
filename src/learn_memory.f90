module learn_memory

  implicit none

  public :: byteof


  private

  integer, parameter :: bool_byte_ = kind(.true.)
  integer, parameter :: char_byte_ = kind('a')
  integer, parameter :: int_byte_  = kind(0)
  integer, parameter :: real_byte_ = kind(0.0)


  interface byteof
     module procedure :: byteof_scalar
     module procedure :: byteof_vector
     module procedure :: byteof_matrix
  end interface byteof

contains

  function byteof_scalar(scalar) result(res)
    class(*), intent(in) :: scalar
    real :: res

    select type(scalar)
    type is(logical)
      res = bool_byte_
    type is(integer)
      res = int_byte_
    type is(real)
      res = real_byte_
    type is(character(*))
      res = len(scalar)*char_byte_
      class default
      error stop "unknow data type"
    end select

  end function byteof_scalar


  function byteof_vector(vector) result(res)
    class(*), intent(in) :: vector(:)
    real :: res

    integer :: i

    select type(vector)
    type is(logical)
      res = size(vector)*bool_byte_
    type is(integer)
      res = size(vector)*int_byte_
    type is(real)
      res = size(vector)*real_byte_
    type is(character(*))
      res = 0.0
      do i = 1, size(vector)
        res = res + len(vector(i))*char_byte_
      enddo
      class default
      error stop "unknow data type"
    end select

  end function byteof_vector


  function byteof_matrix(matrix) result(res)
    class(*), intent(in) :: matrix(:,:)
    real :: res

    integer :: i,j

    select type(matrix)
    type is(logical)
      res = size(matrix)*bool_byte_
    type is(integer)
      res = size(matrix)*int_byte_
    type is(real)
      res = size(matrix)*real_byte_
    type is(character(*))
      res = 0.0
      do j = 1, size(matrix,2)
        do i = 1, size(matrix,1)
          res = res + len(matrix(i,j))*char_byte_
        enddo
      enddo
      class default
      error stop "unknow data type"
    end select

  end function byteof_matrix

end module learn_memory

program main
  use learn_memory
  implicit none


    logical :: ls, lv(10), lm(5,5)
    integer :: is, iv(10), im(5,5)
    real :: rs,rv(10), rm(5,5)
    character(5):: as, av(10), am(5,5)

    real :: bs, bv, bm, bt

    bs = byteof(ls) +  byteof(is) + byteof(rs) + byteof(as)
    bv = byteof(lv) +  byteof(iv) + byteof(rv) + byteof(av)
    bm = byteof(lm) +  byteof(im) + byteof(rm) + byteof(am)

    bt = bs + bv + bm

    print*, 'bs = ',bs,' byte'
    print*, 'bv = ',bv,' byte'
    print*, 'bm = ',bm,' byte'
    print*, 'bt = ',bt,' byte'

end program main
