program learn_iso_c_binding
  use iso_c_binding
  implicit none

  print*, "integer"
  print*, "c_int           = ",c_int
  print*, "c_short         = ",c_short
  print*, "c_long          = ",c_long
  print*, "c_long_long     = ",c_long_long
  print*, "c_signed_char   = ",c_signed_char
  print*, "c_size_t        = ",c_size_t
  print*, "c_int8_t        = ",c_int8_t
  print*, "c_int16_t       = ",c_int16_t
  print*, "c_int32_t       = ",c_int32_t
  print*, "c_int64_t       = ",c_int64_t
  print*, "c_int_least8_t  = ",c_int_least8_t
  print*, "c_int_least16_t = ",c_int_least16_t
  print*, "c_int_least32_t = ",c_int_least32_t
  print*, "c_int_least64_t = ",c_int_least64_t
  print*, "c_int_fast8_t   = ",c_int_fast8_t
  print*, "c_int_fast16_t  = ",c_int_fast16_t
  print*, "c_int_fast32_t  = ",c_int_fast32_t
  print*, "c_int_fast64_t  = ",c_int_fast64_t
  print*, "c_intmax_t      = ",c_intmax_t
  print*, "c_intptr_t      = ",c_intptr_t

  print*,
  print*, "real"
  print*, "c_float       = ",c_float
  print*, "c_double      = ",c_double
  print*, "c_long_double = ",c_long_double

  print*,
  print*, "complex"
  print*, "c_float_complex       = ",c_float_complex
  print*, "c_double_complex      = ",c_double_complex
  print*, "c_long_double_complex = ",c_long_double_complex

  print*,
  print*, "logical"
  print*, "c_bool = ",c_bool

  print*,
  print*, "character"
  print*, "c_char = ",c_char

end program learn_iso_c_binding
