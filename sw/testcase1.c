asm(
   ".set noat             \n\t"
   "li  $1,     0x12340000\n\t"
   "ori $1, $1, 0x5678    \n\t"
   "li  $2,     0x0       \n\t"
   "nop                   \n\t"
   "ori $2, $2, 0x0005    \n\t"
   "mul $3, $2, $1        \n\t"
   "nop                   \n\t"
);
