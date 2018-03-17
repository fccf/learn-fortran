program learn_move_alloc

  implicit none

  real,allocatable :: a(:), b(:)

  allocate(a(3));a = 1.
  print*, 'a = ', a

  allocate(b(size(a)*2));b(1:size(a)) = a;b(size(a)+1:) = a
  print*, 'b = ', b

  print*, 'call move_alloc(from=b,to=a)'
  call move_alloc(from=b,to=a)
  print*, 'b = ', b
  print*, 'a = ', a


end program learn_move_alloc
