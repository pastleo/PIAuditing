#!/bin/bash

gradle tomcatRunWar

# ------------------------------------------------------------
# All tasks runnable from root project
# ------------------------------------------------------------
# 
# Build tasks
# -----------
# assemble - Assembles the outputs of this project.
# build - Assembles and tests this project.
# buildDependents - Assembles and tests this project and all projects that depend on it.
# buildNeeded - Assembles and tests this project and all projects it depends on.
# classes - Assembles classes 'main'.
# clean - Deletes the build directory.
# jar - Assembles a jar archive containing the main classes.
# testClasses - Assembles classes 'test'.
# war - Generates a war archive with all the compiled classes, the web-app content and the libraries.
# 
# Build Setup tasks
# -----------------
# init - Initializes a new Gradle build. [incubating]
# wrapper - Generates Gradle wrapper files. [incubating]
# 
# Documentation tasks
# -------------------
# javadoc - Generates Javadoc API documentation for the main source code.
# 
# Help tasks
# ----------
# components - Displays the components produced by root project 'pia'.
# dependencies - Displays all dependencies declared in root project 'pia'.
# dependencyInsight - Displays the insight into a specific dependency in root project 'pia'.
# help - Displays a help message
# projects - Displays the sub-projects of root project 'pia'.
# properties - Displays the properties of root project 'pia'.
# tasks - Displays the tasks runnable from root project 'pia'.
# 
# Verification tasks
# ------------------
# check - Runs all checks.
# test - Runs the unit tests.
# 
# Web application tasks
# ---------------------
# tomcatJasper - Runs the JSP compiler and turns JSP pages into Java source.
# tomcatRun - Uses your files as and where they are and deploys them to Tomcat.
# tomcatRunWar - Assembles the webapp into a war and deploys it to Tomcat.
# tomcatStop - Stops Tomcat.

