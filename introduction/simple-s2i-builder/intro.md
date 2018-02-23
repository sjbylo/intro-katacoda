If this is the first time you are reading about Source-to-Image (S2I) it is strongly suggested to start with one of the other tutorials which can help you learn how to deploy an application from source code using an S2I builder image. 
Here is one of those tutorials: https://learn.openshift.com/introduction/deploying-python/

The goal of this tutorial is to show, step by step, how to create a simplified S2I builder image yourself and then use the image to create a simplified application. 

This tutorial is divided into two main parts.

Part One explains what's needed to create a new builder image.

- The "simplified runtime" used in this tutorial is just the Linux command "cat", which will output the "source code" provided by running the command "cat src/*"

Part two explains the "source code" for the simplified application. 

- The "source code" is simply files under a src/ directory in your workspace. 

