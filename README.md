# Epipolar Geometry and Fundamental Matrix Computation

## Introduction
This project explores the relative orientation of an image pair through epipolar geometry, utilizing manual selection of homologous points and computation of the fundamental matrix, using MATLAB. The project includes capturing images, identifying correspondences, and visualizing epipolar lines to understand camera perspective and structure from motion.

## Features
- **Image Pair Orientation**: Identification and manual selection of homologous points in image pairs.
- **Fundamental Matrix Computation**: Linear computation of the fundamental matrix using the normalized 8-point algorithm.
- **Epipolar Line Visualization**: Drawing of epipolar lines for both images to analyze their characteristics.
- **Geometric Error Analysis**: Calculation of the symmetric epipolar distance to evaluate the accuracy of the fundamental matrix.

## Technologies
- **MATLAB/Octave**: For implementing algorithms and visualization.
- **Custom MATLAB Functions**: `computeFundamentalMatrix.m` for fundamental matrix computation, `calculateGeometricError.m` for error analysis.

## Getting Started
The repository includes all MATLAB scripts and functions necessary to replicate the project's findings, alongside instructions for running the analysis and visualizing the results.
