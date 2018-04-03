program learn_elemental

  implicit none
  character(2) :: s(3) = ['1 ','2 ','3 ']

  if(all(to_int(s) == [1,2,3]).and.all(to_real(s) == [1.,2.,3.])) print*, 'pass' 

contains
  !=============================================================================
  elemental function to_int(str)
    character(*),intent(in) :: str
    integer :: to_int
    integer :: ios
    read(str, * ,iostat= ios) to_int
  endfunction to_int
  !=============================================================================
  elemental function to_real(str)
    character(*),intent(in) :: str
    real    :: to_real
    integer :: ios
    read(str, * , iostat= ios) to_real
  endfunction to_real

end program learn_elemental
