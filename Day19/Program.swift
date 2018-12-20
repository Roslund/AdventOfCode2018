var R0 = 1
var R1 = 0
var R2 = 0
var R3 = 0
var R4 = 0 // PC
var R5 = 0

func p() {
    R4 += 16                // 0
    R1 = 1                  // 1
    R3 = 1                  // 2
    R5 = R1 * R3            // 3
    if R5 == R2 {           // 4
        R5 = 1
    } else {
        R5 = 0
    }
    R4 += R5                // 5

    R4 += 1                 // 6
    R0 += R1                // 7
    R3 += 3                 // 8

    if R3 > R2 {            // 9
        R5 = 1
    } else {
        R5 = 0
    }
    R4 += R5                // 10
    R4 = 2                  // 11

    R1 += 1                 // 12
    if R1 > R2 {            // 13
        R5 = 1
    } else {
        R5 = 0
    }

    R4 += R5                // 14
    R4 = 1                  // 15
    R4 = R4 * R4            // 16


    R2 += 2                 // 17
    R2 = R2 * R2            // 18
    R2 = R2 * 19            // 19 76
    R2 = R2 * 11            // 20 836
    R5 += 2                 // 21
    R5 = R5 * 22            // 22
    R5 += 18                // 23 62
    R2 += R5                // 24 898
    R4 += R0                // 25
    R4 = 0                  // 26
    R5 = 27                 // 27 27
    R5 = R5 * 28            // 28 756
    R5 += 29                // 29 785
    R5 = R5 * 30            // 30 23 550
    R5 = R5 * 14            // 31
    R5 = R5 * 32            // 32 10 550 400
    R2 += R5                // 33
    R0 = 0                  // 34
    R4 = 0                  // 35
}

func p2() {
    // main
    R2 = 10_551_298         // 33
    R0 = 0                  // 34
    R1 = 1                  // 1
    R3 = 1                  // 2

    // inner loop
    R5 = R1 * R3            // 3
    if R5 == R2 {           // 4
        R0 += R1
    }

    R3 += 1                 // 8

    if R3 > R2 {            // 9
        //nothing
    } else {
        R4 = 2
    }

    // outer loop
    R1 += 1                 // 12
    // exit condition
    if R1 > R2 {            // 13
        return
    } else {
        R4 = 1
    }
    // end outer loop
}

func p3() {
    // main
    R2 = 10_551_298         // 33
    R0 = 0                  // 34
    R1 = 1                  // 1

    repeat {
        R3 = 1              // 2
        repeat {
            R5 = R1 * R3    // 3

            if R5 == R2 {   // 4
                R0 += R1
            }

            R3 += 1         // 8
        } while  !(R3 > R2)

        R1 += 1             // 12
    } while !(R1 > R2)
}

func p4() {
    // main
    R2 = 10_551_298         // 33
    R0 = 0                  // 34
    R1 = 1                  // 1

    repeat {
        R3 = 1              // 2
        repeat {
            R5 = R1 * R3    // 3

            if R5 == R2 {   // 4
                R0 += R1
            }

            R3 += 1         // 8
        } while  !(R3 > R2)

        R1 += 1             // 12
    } while !(R1 > R2)
}
