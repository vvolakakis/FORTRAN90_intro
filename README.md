# FORTRAN90_intro
A very simple and basic intro in FORTRAN 90, going through the setup of your operating system, getting to know the basics of FORTRAN 90, up to coding your way through a few simple examples and functions. Included are the steps of preparing your OS, finding your preferred compiler, installing the necessary modules, some basic introduction to the "grammar" of FORTRAN 90, and listed are some files with examples and simple functions which will enables us to take our first steps.

In the development of the above tutorials and codes presented here, all programming solutions were obtained from publicly available tutorials and resources related to FORTRAN 90. The author of this repository acknowledges that the tutorial guidances, steps, and coding examples are an adaptation of examples and guidance found on (1), (2) and (3). No proprietary or personally developed code is included in this work. Full credit is given to the original authors and contributors of the referenced code, and their contributions are duly acknowledged throughout the manuscript.

References

(1) https://fortran-lang.org/learn/

(2) https://www.fortran90.org/

(2) https://www.nccs.nasa.gov/sites/default/docs/tutorials/f90studentnotes.pdf

Setting up our OS.

    Open source and free: GFortran, Flang, Lfortran

    NVIDIA and Intel offer their compilers for free as well

  Follow detailed steps from: https://fortran-lang.org/learn/os_setup/install_gfortran/ (all steps and directions in this and in the following sections were provided by (1))

    Windows (three different options):
    
      http://www.equation.com, provides 32 and 64-bit x86 executables for GCC version 12.1

      TDM GCC, provides 32 and 64-bit x86 executables for GCC version 10.3

      MinGW-w64 provides a 64-bit x86 executable for GCC version 12.2

    macOS:

        Xcode:

          If you have Xcode installed, open a terminal window and type: xcode-select --install

        Binaries:

          Go to fxcoudert/gfortran-for-macOS (https://github.com/fxcoudert/gfortran-for-macOS/releases) to directly install binaries.
          
        Homebrew:
        
          brew install gcc

        Fink:

          GNU-gcc Package, go to: (https://pdb.finkproject.org/pdb/browse.php?summary=GNU+Compiler+Collection+Version)https://pdb.finkproject.org/pdb/browse.php?summary=GNU+Compiler+Collection+Version

  When we have installed our compiler, a text editor will be needed. Some options: Atom, Emacs, NotePad++, SublimeText, Vim and Neovim, Visual Studio Code, Notepad3.

  We could either use our Command Prompt (Command Window - cmd) to compile first and then run our code. However, the use of IDEs (Integrated Development Environment) is also an option. Some options provided by (1) are the following: AbsoftTools, Visual Studio, Code::Blocks, Eclipse-Photran, Geany, NAG Fortran Builder, among others.
