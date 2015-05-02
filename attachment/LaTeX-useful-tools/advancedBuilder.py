# ST2/ST3 compat
from __future__ import print_function
import sublime
if sublime.version() < '3000':
    # we are on ST2 and Python 2.X
    _ST3 = False
else:
    _ST3 = True

import sublime_plugin
import re
import os, os.path
import codecs

DEBUG = False

DEFAULT_COMMAND_SIMPLE = ["%E",
    "-interaction=nonstopmode -synctex=1", "OPTION"]

DEFAULT_COMMAND_LATEXMK = ["latexmk",
    "-cd", "-e",
    "$pdflatex = '%E -interaction=nonstopmode -synctex=1 OPTION %S %O'",
    "-f", "-pdf"]

DEFAULT_COMMAND_WINDOWS_MIKTEX = ["texify",
    "-b", "-p",
    "--tex-option=\"--synctex=1\"", "OPTION"]

class PdfBuilder(object):
    """Base class for build engines"""
    def __init__(self, tex_root, output, builder_settings, platform_settings):
        self.tex_root = tex_root
        self.tex_dir, self.tex_name = os.path.split(tex_root)
        self.base_name, self.tex_ext = os.path.splitext(self.tex_name)
        self.output_callable = output
        self.out = ""
        self.builder_settings = builder_settings
        self.platform_settings = platform_settings
    def display(self, data):
        self.output_callable(data)
    def set_output(self, out):
        if DEBUG:
            print("Setting out")
            print(out)
        self.out = out
    def commands(self):
        pass
    def cleantemps(self):
        return False

class AdvancedBuilder(PdfBuilder):
    def __init__(self, tex_root, output, builder_settings, platform_settings):
        # Sets the file name parts, plus internal stuff
        super(AdvancedBuilder, self).__init__(tex_root, output, builder_settings, platform_settings)
        self.name = "Advanced Builder"
        # Display output?
        self.display_log = builder_settings.get("display_log", False)
        self.engine = 'pdflatex'
        self.option = ""
    def commands(self):
        # print greeting
        self.display("\n\n")
        self.display("This is the Advanced Builder.")
        self.display("\n")
        # copy vars
        engine = self.engine
        option = self.option
        tex_name = self.tex_name
        builder_name = "SIMPLE"
        # check root file, settings in the comments
        for line in codecs.open(self.tex_root, "r", "UTF-8", "ignore").readlines():
            if not line.startswith("%"):
                # if not comment line, break
                break
            else:
                # process the comment lines
                mEng = re.match(r"%\s*![Tt][Ee][Xx]\s+(?:TS-)?program *= *(xelatex|lualatex|pdflatex|xetex|luatex|pdftex|platex-ng|ptex-ng)\s*$",line)
                mOpt = re.match(r"%\s*![Tt][Ee][Xx]\s+(?:TS-)?option *= *(.*)\s*?$",line)
                mBui = re.match(r"%\s*![Tt][Ee][Xx]\s+(?:TS-)?builder *= *([Ss][Ii][Mm][Pp][Ll][Ee]|[Ll][Aa][Tt][Ee][Xx][Mm][Kk]|[Tt][Ee][Xx][Ii][Ff][Yy])\s*$",line)
                # The engine
                if mEng: # is not None
                    engine = mEng.group(1)
                # The option
                if mOpt: # is not None
                    option = mOpt.group(1)
                if mBui:
                    builder_name = mBui.group(1).upper()
        if builder_name == "LATEXMK":
            cmd = DEFAULT_COMMAND_LATEXMK[:]
        elif builder_name == "TEXIFY":
            cmd = DEFAULT_COMMAND_WINDOWS_MIKTEX[:]
        else:
            cmd = DEFAULT_COMMAND_SIMPLE[:]

        # apply the settings
        if 'latexmk' == cmd[0]:
            cmd[3] = cmd[3].replace("%E", engine).replace("OPTION", option)
        elif 'texify' == cmd[0]:
            if engine != self.engine:
                sublime.error_message("Sorry, cannot select engine using a %!TEX program directive on MikTeX.\n")
                yield("", "Could not compile.")
            if option != self.option:
                cmd[4] = " ".join(["--tex-option=\"%s\"" % opt for opt in option.split(" ")])
            else:
                cmd[4] = ""
        else: # SIMPLE
            cmd[0] = engine
            cmd[2] = option
        # print the whole command
        self.display("Command Line:\n")
        for element in cmd + [tex_name]:
            self.display(element + " ")
        else:
            self.display("\n")
        # texify wants the .tex extension; latexmk doesn't care either way
        yield (cmd + [tex_name], "")
        self.display("Done.\n")

        # This is for debugging purposes
        if self.display_log:
            self.display("\nCommand results:\n")
            self.display(self.out)
            self.display("\n\n")
