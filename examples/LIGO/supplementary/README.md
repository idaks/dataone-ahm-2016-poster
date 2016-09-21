
# Overview
-------- 
The output in [ReproZip](https://github.com/idaks/ligo/tree/master/reprozip "ReproZip") is updated to get a better visualization.

## Modification 

graph.dot is modidified into graph-variant.gv

#### Original graph ([graph.dot](https://github.com/idaks/ligo/blob/master/reprozip/graph.dot "graph.dot"))
    digraph G {
    /* programs */
    node [shape=box fontcolor=white fillcolor=black style=filled];
    run0 [label="0: /usr/bin/python"];

    node [shape=ellipse fontcolor="#131C39" fillcolor="#C9D2ED"];</span>


####   Updated graph ([graph-variant.gv](https://github.com/idaks/ligo/blob/master/reprozip/graph-variant.gv "graph-variant.gv"))
    digraph G {
    rankdir= LR
    /* programs */
    node [shape=box fontcolor=white fillcolor=black style="filled,rounded"];
    run0 [label="0: /usr/bin/python"];

    node [shape=box fontcolor="#131C39" fillcolor="#C9D2ED" fontname=Courier]; 
    
    

 
