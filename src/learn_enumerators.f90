program learn_enumerators
  implicit none

  enum, bind(c)
    enumerator :: one = 1
    enumerator :: two = 2
    enumerator :: thr = 3
    enumerator :: fou = 4
  end enum

  print*,one
  print*,two
  print*,thr
  print*,fou

end program learn_enumerators
