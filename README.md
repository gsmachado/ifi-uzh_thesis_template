
# Introduction #

This is a template which was compiled to ease the process of writing and publishing thesis at the Institute of Informatics (IFI) of University of Zurich (UZH). It includes what I called *Thesis-in-a-Box*: a script that uses Docker to build the thesis in any platform, without having to be concerned to install LaTeX, Xelatex, fonts, etc.

The template can be used either to:
* Ph.D. thesis
* M.Sc. thesis
* B.Sc. thesis

However, M.Sc. and B.Sc. thesis would required some adjustments at the current time. It's in my future todo's to enhance that.

# Disclaimer #

The best practices and rules presented here are not continuously supported by IFI-UZH -- but by individuals that contribute in a free will. It means that: if the formal thesis structure changes in future, there's no guarantee that this template will be updated.

Thus, by cloning/downloading this thesis template you agree to use it at your own risk.

# LaTeX Thesis Organization #

The directory structure is organized as follows:

* `./figs`: directory to hold all thesis figures. It is advisable to create sub-directories reflecting each chapter.
* `./cover`: directory where the cover page is located.
* `./chapters`: directory where chapter files (and some auxiliary ones) are located.
* `./bib`: directory where the bibliography (BibTex) file is located.
* `./fonts`: directory where all font files are located.
* `./packages`: directory where additional latex packages are located.
* `./scripts`: directory where scripts are located. For example, the `build.sh` and `build_docker.sh` scripts are used to build the thesis and generate the final PDF.
* `./thesis.tex`: file which is the thesis root.

# Thesis-in-a-Box: Installation and How to Use #

The thesis-in-a-box is basically a script that builds your thesis using docker. The advantage is that you don't need to be concerned on how to install LaTeX, how to install fonts, or how to install LaTeX packages. Also, you'll not get desperated if your machine crash -- you can build the thesis at anytime again, from any other machine with docker. However... I assume you have a backup of your thesis content files, don't you? :-)

## Software required ##

The only required software is Docker and a bash-compatible shell to run the build script.

Thus, follow these tutorials to install Docker for your specific operating system:
* [OSX][https://docs.docker.com/docker-for-mac/]
* [Linux][https://docs.docker.com/engine/installation/linux/]
* [Windows][https://docs.docker.com/docker-for-windows/]

For Windows, it would be required to have `bash` installed to execute the build script. This [link][http://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/] shows how to install it.

## How to use it? ##

It's pretty easy to "build" and generate the PDF output.

Just execute:

```
$ sh ./scripts/thesis-in-a-box.sh -r `pwd`
```

The parameter `-r` must be specified, and it represents the thesis root directory (where the `thesis.tex` is located). In the example above, it's assumed that you currently are in the root directory -- and that's why the command `pwd` is used.

If you want to execute the build script in another directory, just specify the thesis template root directory:

```
$ sh ./scripts/thesis-in-a-box.sh -r /home/machado/git/ifi-uzh_thesis_template/
```

If you don't have any LaTeX compilation problems, a `thesis.pdf` file should be generated in the root folder as a result of `thesis-in-a-box.sh` execution.

### Is it possible to build without using Docker? ###

Sure. It's possible.

You just have to run the normal `build.sh` script. However, it assumes that you have already installed all required LaTeX packages.

```
$ sh ./scripts/build.sh /path/to/thesis/root
```

The first parameter is the path to the thesis root folder.

# Best Practices #

There are some best practices that are nice to follow. They are here for your own health. :-)

## Labels ##

Labels can be set in many ways in LateX. However, it's good to follow a pattern to name them.

My suggestion is:
* Include the label scope: if the label is from a section, chapter, etc.
* Include the label type: if the label points to a figure, table, equation, etc.

Example:

```
\label{introduction:sec:section_name}
```

This way we know that the `section_name` is a a Section within the `introduction`. In such example `introduction` is specified as a chapter:

```
\label{chap:introduction}
```

Moreover, it's advisable to label everything: references may help you to explain without being so repetitive.

## Figures ##

It's advisable to keep the sources of figures (i.e., SVG, VSDX, etc), and not only the PNG or PDF figures themselves. So, it's a good practice to create a `sources` directory for each of the chapters in `./figs`.

For example: create the directory `./figs/introduction/sources` to place the sources for all figures within the introduction chapter.

## ToDos ##

The template includes the `todonotes` package which provides a way to highlight ToDo's or comments in the generated PDF.

Documentation and examples o nhow to use this powerful package can be found [here][http://mirrors.ctan.org/macros/latex/contrib/todonotes/todonotes.pdf "Todonotes Package Documentation"]. This is especially useful to communicate and make corrections with your thesis advisor.

## Referencing Sections, Chapters, Figures, Equations, ...

When referencing chapters, figures, equations, and so on, the `\ref{}` command does not print the type of reference, but just the number reference.

For example, if you want to reference a Chapter, you must use:

```
[...] as seen in Chapter \ref{chap:introduction} [...]
```

If you would like to reference a figure, then, you would need to replace the word `Chapter` to `Figure` in the above example, also updating the label that points to the respetive figure.

## Italics on latin abbreviations ##

This thesis template follows what is specified in the Chicago Manual of Style. Thus, "e.g.", "i.e.", or any other latin abbreviation *should not* be written in italics.

More info can be found [here][http://www.chicagomanualofstyle.org "Chicago Manual of Style"].

# Figures used in this Template #

The following figures were used in this thesis template:

* [Lenna][https://en.wikipedia.org/wiki/Lenna]
* [Suzanne][https://en.wikipedia.org/wiki/Blender_(software)#Suzanne]
* [Carole Hersee][https://en.wikipedia.org/wiki/Carole_Hersee]
* [Utah Teapot][https://en.wikipedia.org/wiki/Utah_teapot]

# Text used in this template #

Some excerpts of this thesis template were taken from the Tridentine Roman Catholic mass, in latin. The text sources can be be retrieved from [here][http://www.latinliturgy.com/OrdinaryFormMassText.pdf] and [here][http://www.liturgies.net/Liturgies/Catholic/TridentineLatinEnglish.htm].

Other paragraphs are just a repetition of [Lorem Ipsum sample][https://en.wikipedia.org/wiki/Lorem_ipsum].

# Contact #

I will keep maintaining this template with *YOUR* support. So, don't hesitate to create issues, write me questions, and provide pull requests. :-)

Guilherme Sperb Machado <gsm@machados.org>

