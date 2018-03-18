module learn_color
  use iso_fortran_env, only:output_unit
  use iso_c_binding
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

  subroutine show_progress(m,p,ml)
    !! Create a progress bar through successive calls
    character(*),intent(in)::m
    !! Message to display
    real,intent(in)::p
    !! Progress fraction \(p\in[0,1]\), 0 = start progress 1 = complete progress
    integer,intent(in),optional::ml
    !! Message reserve length (used to align long messages)

    real::r
    integer:: mld, n,k
    character(3) :: persent

    write(persent,'(i0)') int(p*100)

    N = 70
    mld = 40
    if(present(ml)) mld = ml

    write(output_unit,'(a)',advance='no') achar(13)//colorize(m//repeat(' ',mld-len(m))//' [',[5,5,0])
    do k=1,N
      r = real(k-1)/real(N-1)
      if(r<=p) then
        write(output_unit,'(1a)',advance='no') colorize('=',color_map(r,[0.0,1.0]))
      else
        write(output_unit,'(1a)',advance='no') colorize(' ',[0,0,0])
      end if
    end do
    write(output_unit,'(a)',advance='no') colorize('] ',[5,5,0]) //colorize(trim(persent)//' %',color_map(p,[0.0,1.0]))
    flush(output_unit)

  end subroutine show_progress

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

  do n = 1,100
    call wait(0.1)
    call show_progress('progress',n/100.0,10)
  enddo
  write(output_unit,*)

contains
  subroutine wait(sec)
    !<Make the thread sleep
    real,intent(in)::sec
    !<Time to sleep in seconds

    integer(c_int)::usec
    integer(c_int)::ret

    interface
      function doSleep(usec) result(e) bind(C,name='usleep')
        use iso_c_binding
        integer(c_int),value::usec
        integer(c_int)::e
      end function doSleep
    end interface

    usec = nint(sec*1.0E6)
    ret  = doSleep(usec)
  end subroutine wait


end program color_test
