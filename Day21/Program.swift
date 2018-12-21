var R0 = 0
var R1 = 0
var R2 = 0
var R3 = 0
var R4 = 0
var R5 = 0

//#ip 2

// Program Check
R5 = 123                //0     seti 123 0 5
if R5 & 456 == 72 {     //1     bani 5 456 5
    R5 = 1              //2     eqri 5 72 5
} else {
    R5 = 0
}
R2 += R5                //3     addr 5 2 2
R2 = 0                  //4     seti 0 0 2


R5 = 0                  //5     seti 0 4 5
R4 = R5 | 65536         //6     bori 5 65536 4
R5 = 1546693            //7     seti 15466939 9 5
R3 = R4 & 255           //8     bani 4 255 3
R5 += R3                //9     addr 5 3 5
R5 = R5 & 16777215      //10    bani 5 16777215 5
R5 = R5 * 65899         //11    muli 5 65899 5
R5 = R5 & 16777215      //12    bani 5 16777215 5
//13    gtir 256 4 3
R2 += R3                //14    addr 3 2 2
R2 += 1                 //15    addi 2 1 2
R2 = 27                 //16    seti 27 8 2
R3 = 0                  //17    seti 0 7 3
R1 = R3 + 1             //18    addi 3 1 1
R1 = R1 * 256           //19    muli 1 256 1
//20    gtrr 1 4 1
R2 += R1                //21    addr 1 2 2
R2 += 1                 //22    addi 2 1 2
R2 = 25                 //23    seti 25 2 2
R3 += 1                 //24    addi 3 1 3
R2 = 17                 //25    seti 17 7 2
R4 = R3                 //26    setr 3 7 4
R2 = 7                  //27    seti 7 3 2
//28    eqrr 5 0 3
R2 += R3                //29    addr 3 2 2
R2 = 5                  //30    seti 5 9 2










while true {
    R4 = 65536              //6     bori 5 65536 4
    R5 = 1546693            //7     seti 15466939 9 5


    while 256 <= R4 {
        R3 = R4 & 255           //8     bani 4 255 3
        R5 += R3                //9     addr 5 3 5
        R5 = R5 & 16777215      //10    bani 5 16777215 5
        R5 = R5 * 65899         //11    muli 5 65899 5
        R5 = R5 & 16777215      //12    bani 5 16777215 5
        R3 = 0                  //17    seti 0 7 3

        while R1 <= R4 {
            R1 = R3 + 1             //18    addi 3 1 1
            R1 = R1 * 256           //19    muli 1 256 1
            R3 += 1                 //24    addi 3 1 3
        }

        R4 = R3                 //26    setr 3 7 4
    }

    if R0 == R5 {           //28
        exit()
    }
}
