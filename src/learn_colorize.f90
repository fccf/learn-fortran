program learn_colorize
  implicit none

  integer, parameter :: black(3) = [0,0,0],&
                      & white(3) = [5,5,5],&
                      & red(3)   = [5,0,0],&
                      & green(3) = [0,5,0],&
                      & blue(3)  = [0,0,5],&
                      & yello(3) = [5,5,0],&
                      & cyan(3)  = [5,0,5],&
                      & purple(3)= [0,5,5]

  print*, colorize('black',black)
  print*, colorize('white',white)
  print*, colorize('red',red)
  print*, colorize('green',green)
  print*, colorize('blue',blue)
  print*, colorize('yello',yello)
  print*, colorize('cyan',cyan)
  print*, colorize('purple',purple)

contains
  function colorize(s,c) result(o)
    !< Bracket a string with text to change its color on a terminal
    character(*),intent(in)::s !< String to colorize
    integer,dimension(3),intent(in)::c ! c in [0,5]
    !< Color to use in [r,g,b] format, where \(r,g,b \in [0,5]\)
    character(:),allocatable::o
    character(1),parameter::ESC = achar(27)
    character(3),parameter::post = '[0m'
    character(8) :: pre

    write(pre,'(i0)') 36*c(1)+6*c(2)+c(3)+16

    o = ESC//'[38;5;'//trim(adjustl(pre))//'m'//s//ESC//post

  end function colorize
end program learn_colorize
