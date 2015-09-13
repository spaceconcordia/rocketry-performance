# Version Control for Matlab and Simulink

## Introduction
The goal is to be able to have version control for the Matlab files that handle flight calculations as well as the Simulink model. Simulink models are binary files which do not play nice with Git. A system is needed that works well with both binary and ascii files and plays nicely with Matlab/Simulink.

## Scope
Attain version control for Matlab files and Simulink Models

## Comparison

| Solution  | License   | Notes                                     |
| ---       | ---       | ---                                       |
| SimDiff/SimMerge   | Non-Free  | http://www.ensoftcorp.com/simdiff/all-simdiff-and-simmerge-editions/  |
| DiffPlug  | Non-Free  | http://www.diffplug.com/features/simulink | 
| Simulink Projects | Non-Free | http://www.mathworks.com/discovery/simulink-projects.html| 
| Git Annex         | Free      | Tracks binary files without content tracking http://git-annex.branchable.com/ |

## Detailed Description

### Simulink Projects

### Git Annex


## Notes

My suggestion would be, if possible, to use model references. I have a large model which basically links half a dozen sub models using model referencing. Each sub model is under version control and only one developer is responsible for a sub model then it side steps a lot of the problems in merging different simulink models.

## References

http://www.xilinx.com/support/documentation/application_notes/xapp498.pdf
http://papers.sae.org/2010-01-0940/
http://www.mathworks.com/help/simulink/ug/set-up-git-source-control.html
http://stackoverflow.com/questions/26677040/using-github-with-matlab-r2014b
http://stackoverflow.com/questions/1788646/matlab-simulink-version-control-with-multiple-developers

