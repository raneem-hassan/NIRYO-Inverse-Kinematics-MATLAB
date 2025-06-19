# Robot Kinematics MATLAB Code

This repository contains MATLAB code to perform both Direct Kinematics (DKM) and Inverse Kinematics (IKM) calculations for a 6-DOF robotic manipulator modeled after the Niryo robot arm, using Denavit-Hartenberg parameters and symbolic computation.

---

## Overview

The code consists of:

- **Forward Kinematics (DKM):**  
  Computes the end-effector position and orientation from given joint angles using the Denavit-Hartenberg (DH) convention.

- **Inverse Kinematics (IKM):**  
  Calculates all possible joint angles for a desired end-effector position and orientation.

- **Modular functions:**  
  Functions to compute transformation matrices, simplify symbolic expressions, and handle the spherical wrist inverse kinematics.

---

## Contents

- `StandardTest_NIRYO_IKM.m`: Main script performing kinematics calculations, including:
  - Definition of DH parameters and robot dimensions.
  - Calling the `PaulMethod` function to compute transformation matrices.
  - Direct kinematics calculation for given joint angles.
  - Inverse kinematics to find joint angles for a specified end-effector pose.
  - Presentation of solutions in a readable table format.

- `PaulMethod.m`:  
  Computes individual and combined homogeneous transformation matrices from DH parameters.

- `IKM_NIRYO_SphericalWrist.m`:  
  Calculates the wrist joint angles (θ4, θ5, θ6) given the first three joint angles and the desired wrist pose.

- `IKM_NIRYO_Arm.m`:  
  Computes the first three joint angles (θ1, θ2, θ3) for the arm section based on wrist position.

- `IKM_NIRYO.m`:  
  Combines arm and wrist inverse kinematics to output all six joint angles from the end-effector pose.

- `TransMatrix.m`:  
  Constructs individual DH transformation matrices.

- `T0eMatrix.m`:  
  Calculates overall transformation matrix from base to end-effector by multiplying DH matrices.

- `simplifyMatrix.m`:  
  Simplifies symbolic matrices by substituting trigonometric expressions with shorter symbolic notations.


