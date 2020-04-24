# Machine Learning Examples
[heading__top]:
  #machine-learning-examples
  "&#x2B06; Simple and complex Awk scripts for learning Machine Learning basics"


Simple and complex Awk scripts for learning Machine Learning basics

## [![Byte size of Machine Learning Examples][badge__master__machine_learning_examples__source_code]][machine_learning_examples__master__source_code] [![Open Issues][badge__issues__machine_learning_examples]][issues__machine_learning_examples] [![Open Pull Requests][badge__pull_requests__machine_learning_examples]][pull_requests__machine_learning_examples] [![Latest commits][badge__commits__machine_learning_examples__master]][commits__machine_learning_examples__master]

------


- [:arrow_up: Top of Document][heading__top]

- [:building_construction: Requirements][heading__requirements]

- [:zap: Quick Start][heading__quick_start]

- [&#x1F5D2; Notes][heading__notes]

- [:card_index: Attribution][heading__attribution]

- [:balance_scale: Licensing][heading__license]


___


## Requirements
[heading__requirements]:
  #requirements
  "&#x1F3D7; Prerequisites and/or dependencies that this project needs to function properly"


Awk, GAwk, or MAwk must be installed to make use of scripts within this repository, for Debian based Linux distributions that'd look similar to...


```Bash
sudo apt-get install gawk
```


___


## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; Perhaps as easy as one, 2.0,..."


Clone this project...


**Linux/MacOS**


```Bash
mkdir -vp ~/git/hub/awk-utilities

cd ~/git/hub/awk-utilities

git clone git@github.com:awk-utilities/machine-learning-examples.git
```


**Windows**


```Batch
set _organization_directory="%HOMEDRIVE%%HOMEPATH%\git\hub\awk-utilities"

if not exists %_organization_directory (
  md %_organization_directory
)

CD /D %_organization_directory

git clone git@github.com:awk-utilities/machine-learning-examples.git
```


Linux based distributions with MAwk, GAwk, and/or Awk installed generally may run Awk scripts directly, eg...


```Bash
script_name.awk --param=value input_file.ext
```


... however, some systems do not have the Awk executable linked to `/usr/bin/awk` file path, in such cases Awk scripts must be invoked via...


```Bash
awk -f script_name.awk --param=value input_file.ext
```


Each script within the `application-examples` directory of this repository may be run with the `--usage` parameter to display available command-line options, eg...


```Bash
./application-examples/p001-Basic-Neuron-3-inputs.awk --usage
```


___


## Notes
[heading__notes]:
  #notes
  "&#x1F5D2; Additional things to keep in mind when developing"


This repository is not feature complete and may include bugs, Pull Requests are certainly welcomed to add features and/or fix Issues.


This repository currently is inspired by and closely following the [YouTube Playlist -- Neural Networks from Scratch in Python](https://www.youtube.com/playlist?list=PLQVvvaa0QuDcjD5BAw2DxE6OF2tius3V3) by `@Sentdex`, while also attempting to provide more complex example code for the Awk scripting language.


___


## Attribution
[heading__attribution]:
  #attribution
  "&#x1F4C7; Resources that where helpful in building this project so far."


- [GitHub -- `github-utilities/make-readme`](https://github.com/github-utilities/make-readme)

- [YouTube -- `Neural Networks from Scratch - P.1 Intro and Neuron Code`](https://www.youtube.com/watch?v=Wo5dMEP_BbI)

- [YouTube -- `Neural Networks from Scratch - P.2 Coding a Layer`](https://www.youtube.com/watch?v=lGLto9Xd7bU)


___


## License
[heading__license]:
  #license
  "&#x2696; Legal side of Open Source"


```
Documentation for simple and complex Awk scripts for learning Machine Learning basics
Copyright (C) 2020 S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

```


For further details review full length version of [AGPL-3.0][branch__current__license] License.


> Note, unless otherwise stated within comments of individual scripts, the scripts within the `quick-examples` are licensed under the MIT license because they are directly translated from examples provided by [`Sentdex/NNfSiX`](https://github.com/Sentdex/NNfSiX) GitHub repository
>
> And unless otherwise stated within comments of individual scripts, the scripts within the `application-examples` directory are licensed under the AGPL-3.0 open source license.


[branch__current__license]:
  /LICENSE
  "&#x2696; Full length version of AGPL-3.0 License"


[badge__commits__machine_learning_examples__master]:
  https://img.shields.io/github/last-commit/awk-utilities/machine-learning-examples/master.svg

[commits__machine_learning_examples__master]:
  https://github.com/awk-utilities/machine-learning-examples/commits/master
  "&#x1F4DD; History of changes on this branch"


[machine_learning_examples__community]:
  https://github.com/awk-utilities/machine-learning-examples/community
  "&#x1F331; Dedicated to functioning code"

[machine_learning_examples__gh_pages]:
  https://github.com/awk-utilities/machine-learning-examples/tree/
  "Source code examples hosted thanks to GitHub Pages!"

[badge__gh_pages__machine_learning_examples]:
  https://img.shields.io/website/https/awk-utilities.github.io/machine-learning-examples/index.html.svg?down_color=darkorange&down_message=Offline&label=Demo&logo=Demo%20Site&up_color=success&up_message=Online

[gh_pages__machine_learning_examples]:
  https/awk-utilities.github.io/machine-learning-examples/index.html
  "&#x1F52C; Check the example collection tests"

[issues__machine_learning_examples]:
  https://github.com/awk-utilities/machine-learning-examples/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."

[pull_requests__machine_learning_examples]:
  https://github.com/awk-utilities/machine-learning-examples/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"

[machine_learning_examples__master__source_code]:
  https://github.com/awk-utilities/machine-learning-examples/
  "&#x2328; Project source!"

[badge__issues__machine_learning_examples]:
  https://img.shields.io/github/issues/awk-utilities/machine-learning-examples.svg

[badge__pull_requests__machine_learning_examples]:
  https://img.shields.io/github/issues-pr/awk-utilities/machine-learning-examples.svg

[badge__master__machine_learning_examples__source_code]:
  https://img.shields.io/github/repo-size/awk-utilities/machine-learning-examples
