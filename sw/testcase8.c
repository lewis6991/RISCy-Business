int main()
{
    asm("lui $ra,0xffff");
    asm("ori $ra,$ra,0xffff");
    
    volatile int result = 0;
    int i = 10;
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    result = i;
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    *((int*)0x2) = result;
}
