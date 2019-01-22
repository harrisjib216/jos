void dumb_code() {                              /*
                                                 * when the files are linked, the bootloader will find main function
                                                 * we complile this 'kernel.c' file into a binary/with its ASEM code
                                                 * for the bootloader to recognize/call the code from ASEM
                                                */
}


void main() {
    char* videoMem = (char*) 0xb8000;           // get pointer to\from video mem location
    *videoMem = 'J';                            // output to the screen
}