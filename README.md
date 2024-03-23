# Technical exercise

This repo has the code for the technical exercise

## There is an Unlocked Package to be used that can be installed

Package Id: "04tPK000000Rk6nYAC"

Script to use the package

Create a no namespace scratch org

Install the package

```
sf org create scratch -m -a FormStackDeveloper -e developer

sf package install --package "Formstack Example@0.1.0-1" --target-org FormStackDeveloper --wait 10 --publish-wait 10
```
