module learn_allocatable_character

  implicit none

  type string
    character(:), allocatable :: v
  end type string


end module learn_allocatable_character

program alloc_char_test
  use learn_allocatable_character
  implicit none

  character(:), allocatable :: s
  type(string), allocatable :: sv(:)
  integer :: i

  s = 'a'
  print*, 's = '//s
  s = 'abc'
  print*, 's = '//s
  s = 'abc efg'
  print*, 's = '//s

  allocate(sv(3))

  sv(1)%v = 'a'
  sv(2)%v = 'abc'
  sv(3)%v = 'abc efg'

  do i = 1, 3
    print'(a,i0,a)', 'sv(',i,') = '//sv(i)%v
  enddo

end program alloc_char_test
