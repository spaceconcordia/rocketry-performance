# Managing Matlab/Simulink Libraries

## Introduction
The goal is to create a robust Simulink model that references Matlab code from files that can be tracked by versioning software (Git). The Matlab source should be editable and effect changes in the Simulink model.

The way to accomplish this is using Simulink Libraries and S-function blocks. Level 1 S-function blocks in Simulink allow linking to an external .m file that can be versioned using Git. Simulink Libraries can include these S-Function models, and come with their own versioning and collaboration methods (locking, etc.). 

By a combination of both, full versioning control can be achieved in the project.

## Creating a Library
1. Open Matlab
2. Open Simulink
3. Click File --> New --> Library

## Add to path
Permanently add your workspace to the Matlab path. At the command prompt:
```
>> pathtool
```
[Alternatively, try this howto](http://www3.nd.edu/~nancy/Math20550/Homework/matlabpath.pdf)

## Add to Library Browser
[Add to Library Browser](http://www.mathworks.com/help/simulink/ug/adding-libraries-to-the-library-browser.html)

