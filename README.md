# dataone-ahm-2016-poster
Runnable examples of YW provenance queries highlighted in poster for DataONE AHM 2016.

Introduction

The purpose of this demo is to demonstrate the Yesworkflow (YW) query ability to use the prospective provenance created by YW and the retrospective provenance together to answer queries that can not be answered solely by prospective provenance or retrospective provenance.
The prospective provenance in this demo is created by YW which models conventional scripts and programs as scientific workflows. YW can provide a number of the benefits of using a scientific workflow management system without having to rewrite scripts and other scientific software. A YW user simply adds special YW comments to existing scripts. These comments declare how data is used and results produced, step by step, by the script. Then, YW interprets these comments and produces graphical output that reveals the stages of computation and the flow of data in the script.

There are various approaches to capture the retrospective provenance. Retrospective Provenance Observables, e.g., from DataONE RunManagers (file-level), ReproZip (OS-level), or noWorkflow (Python code-level) only yield isolated fragments of the overall data lineage and processing history. In this demo, two types of retrospective provenance observables are used: yw-reon and DataONE RunManager. The yw-recon can search the file system for files that match the URI templates declared for @IN and @OUT ports in the script. On the other hand, DataONE RunManager can authorize a list of input and output files for a script run. 

Layouts of Repository

examples/:   Contains examples demonstrating the queries in the queries folder
queries/: it stores the scripts to the five demo queries we asked.
rules/: it contains a set of Prolog rules for generating prospective yesworkflow views rules (yw_rules.P and yw_views.P), retrospective reconstructed rules (recon_rules.P), graph rendering rules (gv_rules.P), and populating graph rules (yw_graph_rules.P).

