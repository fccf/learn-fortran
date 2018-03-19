program learn_iso_fortran_env
  use iso_fortran_env
  implicit none

  print*, 'int32 = ',int32
  print*, 'int64 = ',int64
  print*, 'real32 = ',real32
  print*, 'real64 = ',real64
  print*, 'input_unit = ',input_unit
  print*, 'output_unit = ',output_unit
  print*, 'error_unit = ',error_unit
  print*, 'numeric_storage_size = ',numeric_storage_size
  print*, 'character_storage_size = ',character_storage_size
  print*, 'file_storage_size = ',file_storage_size
  print*, 'iostat_end = ',iostat_end
  print*, 'iostat_eor = ',iostat_eor
  

end program learn_iso_fortran_env
