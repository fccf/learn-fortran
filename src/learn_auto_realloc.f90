program learn_auto_realloc

  implicit none

  real, allocatable :: rv(:)
  integer, allocatable ::  im(:,:)

  allocate(rv(1));rv = 0.
  allocate(im(2,2));im = 0

  print*, 'rv = ',rv

  rv = [1.,2.,3.,4.]
  print*, 'rv = ',rv

  print*, 'im = ',im
  im = reshape([1,2,3,4,5,6,7,8,9],[3,3])
  print*, 'im = ',im 

end program learn_auto_realloc
