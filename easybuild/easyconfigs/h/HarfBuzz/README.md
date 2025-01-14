# HarfBuzz instructions

  * [HarfBuzz web site](http://www.freedesktop.org/wiki/Software/HarfBuzz)

  * [HArfBuzz on GitHub](https://github.com/harfbuzz/harfbuzz)

      * [GitHub releases](https://github.com/harfbuzz/harfbuzz/releases)


## EasyBuild

  * [HarfBuzz support in the EasyBuilders repository](https://github.com/easybuilders/easybuild-easyconfigs/tree/develop/easybuild/easyconfigs/h/HarfBuzz)

  * Three is no HarfBuzz support in the CSCS repository.


### Version 2.8.2 for cpe 21.08

  * It was a deliberate choice to stick to version 2.8.2 even though there
    was already a 3.1.1 version. There were API changes in version 3.0.0 (and
    the 2.9 versions which were really a preparation for 3.0) so there were
    concerns that it might break builds.

  * The EasyConfig is a mix of the EasyBuilders and UAntwerpen ones.

### Version 4.2.1 for CPE 22.06

  * Last-minute update to align with the 2022a toolchains in EasyBuild 4.6.0.

  * Sources taken from where we took them before rather than using the sources
    statements from the EasyBuild 4.6.0 version as that one produced problems
    during the configure step.

