program learn_newline

  implicit none

  print'(a)', 'first line'//new_line('a')//'second line'
  print'(a,/,a)', 'first line','second line'

end program learn_newline
