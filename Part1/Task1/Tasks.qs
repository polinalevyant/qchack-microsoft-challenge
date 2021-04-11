namespace QCHack.Task1 {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Arrays;

    // Task 1 (1 point). f(x) = 1 if x is divisible by 4
    //         
    // Inputs:
    //      1) an N-qubit array "inputs" (3 ≤ N ≤ 5),
    //      2) a qubit "output".
    // Goal: Implement a marking oracle for function f(x) = 1 if x is divisible by 4.
    //       That is, if both inputs are in a basis state, flip the state of the output qubit 
    //       if and only if the number written in the array "inputs" is divisible by 4,
    //       and leave the state of the array "inputs" unchanged.
    //       The array "inputs" uses little-endian encoding, i.e., 
    //       the least significant bit of the integer is stored first.
    //       The effect of the oracle on superposition states should be defined by its linearity.
    //       Don't use measurements; the implementation should use only X gates and its controlled variants.
    //       This task will be tested using ToffoliSimulator.
    // 
    // Example: the result of applying the oracle to a state (|001⟩ + |100⟩ + |111⟩)/√3 ⊗ |0⟩
    // will be 1/√3|001⟩ ⊗ |1⟩ + 1/√3|100⟩ ⊗ |0⟩ + 1/√3|111⟩ ⊗ |0⟩.
    //
    operation Task1_DivisibleByFour (inputs : Qubit[], output : Qubit) : Unit is Adj+Ctl {
        if Length(inputs) == 3 {
            let pattern0 = [false, false, false];
            let pattern1 = [false, false, true];
            (ControlledOnBitString(pattern0, X))(inputs, output);
            (ControlledOnBitString(pattern1, X))(inputs, output);
        } elif Length(inputs) == 4 {
            let pattern0 = [false, false, false, false];
            let pattern1 = [false, false, false, true];
            let pattern2 = [false, false, true, true];
            (ControlledOnBitString(pattern0, X))(inputs, output);
            (ControlledOnBitString(pattern1, X))(inputs, output);
            (ControlledOnBitString(pattern2, X))(inputs, output);
        } else {
            let pattern0 = [false, false, false, false, false];
            let pattern1 = [false, false, false, false, true];
            let pattern2 = [false, false, false, true, true];
            let pattern3 = [false, false, true, false, true];
            let pattern4 = [false, false, true, true, true];
            (ControlledOnBitString(pattern0, X))(inputs, output);
            (ControlledOnBitString(pattern1, X))(inputs, output);
            (ControlledOnBitString(pattern2, X))(inputs, output);
            (ControlledOnBitString(pattern3, X))(inputs, output);
            (ControlledOnBitString(pattern4, X))(inputs, output);
        }
    }
}

