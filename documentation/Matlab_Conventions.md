## Matlab Conventions

## Matlab/Simulink Libraries

## Overview
The goal is to create a robust Simulink model that references Matlab code from files that can be tracked by versioning software (Git). The Matlab source should be editable and effect changes in the Simulink model.

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

## Algebraic Loops

With systems that involve direct-feedthrough (feedback), it is common to encounter an algebraic loop, wherein the output of a function is also an input of the same function.

e.g. 
$$ u = f(u) $$

These can commonly be solved with a combination of *Atomic Subsystems*, *Initial Conditions*, or *Unit-Delay*. 
This matter is discussed thoroughly in the following guide

[Algebraic-Loops](http://www.mathworks.com/help/simulink/ug/algebraic-loops.html)

## Importing Data

Tabulated input data is relied upon to drive the simulation (see *Dynamic Parameters*). The following configuration is investigated to support this smoothly

[Recommended Methods for Importing Data](http://www.mathworks.com/help/matlab/import_export/recommended-methods-for-importing-data.html)

[Load Signal Data for Simulation](http://www.mathworks.com/help/simulink/import-data.html)

[Importing Signal Data in Simulink](http://www.mathworks.com/help/simulink/ug/importing-signal-data-in-simulink.html)

[Import Data Structures](http://www.mathworks.com/help/simulink/ug/importing-data-structures-to-a-root-level-input-port.html)

### From File 

The *From File* block in Simulink allows incremental loading of data 

> The From File block reads data from a MAT-file and outputs the data as a signal. The data is a sequence of samples. Each sample consists of a time stamp and an associated data value.

[From File](http://www.mathworks.com/help/simulink/slref/fromfile.html)

##### Mat-File Versions

Data is read incrementally from Mat-File versions 7.3 and above
[Mat-file Versions](http://www.mathworks.com/help/matlab/import_export/mat-file-versions.html)

#### nD Lookup Tables

#### Specifying Time Data

[Specifying Time Data in Simulink](http://www.mathworks.com/help/simulink/ug/importing-data-structures-to-a-root-level-input-port.html#bsuwoyk)

## Versioning for Matlab Files

### Background
- Older versions allowed providing external '.m' file for the *Matlab Function* block in Simulink
- Newer versions are shifting towards the embedded model, where Matlab code is complied for execution on test hardware

[Naming conventions in Simulink for Matlab files changed after 2011A](http://www.goddardconsulting.ca/simulink-using-embedded-matlab.html)

#### Interpreted Matlab Function

*Interpreted Matlab Function* blocks are used to reference Matlab files so they can be versioned in Git.
*Interpreted Matlab Function* blocks only accept one input and one output, therefore we must pass an array as input and an array as output. 
The contents of the array will contain our variables of interest. *(De))Mux* and *Bus* blocks may be useful to streamline the model.

1. Write your Matlab function 
2. Create a Simulink Model
3. Add the *Interpreted Matlab Function* block
4. Double-click the added block, and enter the name of your function as directed. Select 'OK'
5. Right-click the block, expand the 'Mask', and select 'Create Mask'
6. Add the following in the 'Icon Drawing Commands' box
~~~
disp('function_name')
~~~
7. Add a *Mux* block to combine your inports into a single input array, and a *Demux* port to unpack your output array into outports

### Versioning for Libraries
- Saving files as libraries and following the existing use cases in the documentation will allow robust versioning and collaboration workflow

### Unit Testing

#### Simulink Unit Testing

##### Model Referencing

Model Referencing shall be used to test all libraries for expected behavior. 

1. Create a Test Model in which you drag the Library
2. Provide all test inputs and output assertion
3. Create another model to contain all the test cases created in *2*
4. From the *Simulink Library*, drag a *Model Reference* block
5. Edit the *Model Reference* block, providing the name of the Test Model created in *2*
6. Run the model created in *3* to verify the model referencing was successful

More information:

- http://www.mathworks.com/videos/getting-started-with-model-referencing-68918.html
- http://www.mathworks.com/help/simulink/ug/creating-a-model-reference.html 
- http://www.mathworks.com/help/simulink/slref/model.html

## Exporting Images

High quality figures brings a great deal of value to a report.
Simulink Models and Matlab figures can be exported to scalable vector graphics and PDF formats at high quality.

### GhostScript

[GhostScript](http://www.ghostscript.com/) is needed to handle the EPS format. 
It can be downloaded [here](http://www.ghostscript.com/download/).

### GhostScript and GIMP

GIMP has problems opening EPS files with the default configuration. 
Follow the instructions [here](http://blog.tjitjing.com/index.php/2013/05/solution-error-open-eps-in-gimp-64-bit-with-ghostscript.html) to fix GhostScript in GIMP


### Exporting Figures

[export-fig](http://www.mathworks.com/matlabcentral/fileexchange/23629-export-fig) is a Matlab library which provides functions to output figures to various formats

### Exporting Simulink Models
 
[export Simulink models to publication-quality figures](https://truongnghiem.wordpress.com/2010/07/07/export-simulink-models-to-publication-quality-figures/)

[publication quality graphics in Matlab](https://truongnghiem.wordpress.com/2010/05/28/more-on-publication-quality-graphics-in-matlab/)

[LaPrint](http://www.mathworks.com/matlabcentral/fileexchange/4638-laprint)


[Howto](http://www.mathworks.com/matlabcentral/answers/94951-how-do-i-save-my-simulink-model-as-a-tiff-or-jpeg-image)

## File Organization

- data
- documentation
- functions
- libraries
- models
- referencing
- scripts
- testing

### data

#### data $\rightarrow$ csv

### documentation

- documentation
    - images
    - template

The *documentation* folder contains all markdown files with project documentation. It also contains

#### documentation $\rightarrow$ images

Contains all images used in the documentation

#### documentation $\rightarrow$ template

Contains LaTeX/Pandoc/Markdown template and styling files

#### functions

#### libraries

#### models

#### referencing

#### scripts

#### testing


## Naming Conventions

### Variables

All variables must be lowercase, separated by underscores

e.g.

```
wet_motor_weight
```

### Functions

All *Matlab Functions* must be CamelCase 

e.g. 
```
DynamicWeightCalculation
```

### Models

All *Matlab Model* names must be CamelCase, and end in the word 'Model'

e.g.

```
DynamicWeightCalculationModel
```

### Libraries

All *Matlab Library* names must be CamelCase, and end in the word 'Library'

e.g.

```
DynamicWeightCalculationLibrary
```

