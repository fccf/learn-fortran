module learn_elemental

  implicit none

contains

  elemental function to_int(str)
    character(*),intent(in) :: str
    integer :: to_int
    integer :: ios

    read(str, * ,iostat= ios) to_int
    ! if(ios /= 0) error stop 'string "'//str//'" is not a integer number'
  endfunction to_int


  elemental function to_real(str)
    character(*),intent(in) :: str
    real    :: to_real
    integer :: ios

    read(str, * , iostat= ios) to_real
    ! if(ios /= 0) error stop 'string "'//str//'" is not a real number'
  endfunction to_real

end module learn_elemental

program test_elemental
  use learn_elemental
  implicit none

  character(2) :: s(3) = ['1 ','2 ','3 ']

  print*,'character = ',s
  print*,'integer = ',to_int(s)
  print*,'real = ',to_real(s)


end program test_elemental
