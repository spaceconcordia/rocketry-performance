## Matlab Conventions

### Versioning for Matlab Files
S-function (level 1) blocks are proposed to be used to reference Matlab files so they can be versioned in Git

#### Background
- Older versions allowed providing external '.m' file for the *Matlab Function* block in Simulink
- Newer versions are shifting towards the embedded model, where Matlab code is complied for execution on test hardware

#### S-Functions

- [S-Function Doc with Examples](http://www.mathworks.com/help/simulink/matlab-s-functions-1.html)
- [S-Function Features](http://www.mathworks.com/help/simulink/sfg/s-function-features.html)
- [Writing Level 2 Matlab S-Functions](http://www.mathworks.com/help/simulink/sfg/writing-level-2-matlab-s-functions.html)
- [Level 1 versus Level 2 S-Functions](http://www.mathworks.com/help/simulink/sfg/level-1-versus-level-2-s-functions.html)
- [Types of Sample Time](http://www.mathworks.com/help/simulink/ug/types-of-sample-time.html)

##### Level 1 vs Level 2

Level 1 S-Functions only support a single input and output (See S-Function-Features).
Level 1 S-Functions appear to be suitable for continuous sample time, while Level 2 S-Functions are required for discrete sample time

#### Current Status
- With the help of Narendra Gollu I am looking into whether the old behavior can be achieved easily

### Versioning for Libraries
- Saving files as libraries and following the existing use cases in the documentation will allow robust versioning and collaboration workflow

### Unit Testing

#### Simulink Unit Testing

##### Model Referencing

Model Referencing shall be used to test all libraries for expected behavior. 

Model Referencing with Libraries is a little more complicated

1. Create a Model in which you drag the Library
2. Right-click the library block in the Model 

Start here:

- http://www.mathworks.com/videos/getting-started-with-model-referencing-68918.html
- http://www.mathworks.com/help/simulink/ug/creating-a-model-reference.html 

#### Background
- Once a library is created, it can be unit tested
- A reference model shall be created, to which the library will be encapsulated
- A Test_Model shall be created which includes the reference model, to which test data can be asserted, and output data can be tested

- Model Referencing
    - Reference Model
    - Library Model

### Resources
- http://www.mathworks.com/help/simulink/slref/model.html
