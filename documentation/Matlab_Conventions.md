# Matlab Conventions

## Versioning for Matlab Files

### Background
- Older versions allowed providing external '.m' file for the *Matlab Function* block in Simulink
- Newer versions are shifting towards the embedded model, where Matlab code is complied for execution on test hardware

### Current Status
- S-function (level 1) may be used to recreate the desired behavior
- Shawn and Narendra are looking into whether the old behavior can be achieved easily

## Versioning for Libraries
- Saving files as libraries and following the existing use cases in the documentation will allow robust versioning and collaboration workflow

## Unit Testing

### Background
- Once a library is created, it can be unit tested
- A reference model shall be created, to which the library will be encapsulated
- A Test_Model shall be created which includes the reference model, to which test data can be asserted, and output data can be tested

- Model Referencing
    - Reference Model
    - Library Model

## Open Questions

## Resources
- http://www.mathworks.com/help/simulink/slref/model.html
