
# Overview
-------- 
The output in [ReproZip](https://github.com/idaks/ligo/tree/master/reprozip "ReproZip") is updated to get a better visualization.

## Modification 

graph.dot is modidified into graph-variant.gv

#### Original graph ([graph.dot](https://github.com/idaks/ligo/blob/master/reprozip/graph.dot "graph.dot"))
    digraph G {
    /* programs */
    <span style="color:red"> node [shape=box fontcolor=white fillcolor=black style=filled];</span>
    run0 [label="0: /usr/bin/python"];

    <span style="color:red"> node [shape=ellipse fontcolor="#131C39" fillcolor="#C9D2ED"];</span>


####   Updated graph ([graph-variant.gv](https://github.com/idaks/ligo/blob/master/reprozip/graph-variant.gv "graph-variant.gv"))
    digraph G {
    <span style="color:red"> rankdir= LR </span>
    /* programs */
    <span style="color:red"> node [shape=box fontcolor=white fillcolor=black style="filled,rounded"];</span>
    run0 [label="0: /usr/bin/python"];

    <font color='red'>  node [shape=box fontcolor="#131C39" fillcolor="#C9D2ED" fontname=Courier]; </font>
    
    
    
<p style="color:red"> text </p>


<span style="color:red">red</span>, violets are <span style="color:blue">blue</span>



 
