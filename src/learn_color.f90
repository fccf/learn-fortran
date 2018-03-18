module learn_color

  implicit none

contains
  function colorize(s,c) result(o)
    !< Bracket a string with text to change its color on a terminal
    character(*),intent(in)::s !< String to colorize
    integer,dimension(3),intent(in)::c ! c in [0,5]
    !< Color to use in [r,g,b] format, where \(r,g,b \in [0,5]\)
    character(:),allocatable::o

    ! character(1),parameter::CR  = achar(13)
    character(1),parameter::ESC = achar(27)
    character(3),parameter::post = '[0m'
    character(8) :: pre

    write(pre,'(i0)') 36*c(1)+6*c(2)+c(3)+16

    o = ESC//'[38;5;'//trim(adjustl(pre))//'m'//s//ESC//post

  end function colorize


  function color_map(v,r) result(c)
    !< Return the color code for colorize based on the coolwarm color map
    real,intent(in)::v
    !! Value to map
    real,dimension(2),intent(in)::r
    !! Range over which to scale the colors
    integer,dimension(3)::c

    integer::s

    if(v<sum(r)/2.0) then
      s = nint((v-r(1))/(sum(r)/2.0-r(1))*5.0)
      c = [s,s,5]
    else
      s = 5-nint((v-sum(r)/2.0)/(r(2)-sum(r)/2.0)*5.0)
      c = [5,s,s]
    end if

  end function color_map

end module learn_color

program color_test
  use learn_color
  implicit none
  integer :: n

  print*, colorize('black',[0,0,0])
  print*, colorize('white',[5,5,5])
  print*, colorize('red',[5,0,0])
  print*, colorize('green',[0,5,0])
  print*, colorize('blue',[0,0,5])
  print*, colorize('yello',[5,5,0])
  print*, colorize('cyan',[5,0,5])
  print*, colorize('purple',[0,5,5])

  do n = 0,20
    print*, colorize('corlormap',color_map(v=0.05*n,r=[0.,1.]))
  enddo

end program color_test
